function reconstruction(app,tiffFiles,varFolderValue,varExpFactorFieldValue,varPathPsfEmission,...
    varFilePsfEmission,varExpFactorPSFFieldValue,varPathPsfExcitation,varFilePsfExcitation,...
    varNumItFieldValue,varWienerParamFieldValue,varShowImages, varSpeckleperimage, varOverlapStream,...
    varRegularisationParameter, varBackupFolder)

% tiffFiles : struct of all the tiffs in the varFolderValue
% varFolderValue : path of tiffFiles
% varExpFactorFieldValue : Image expansion factor, physical size of pixels will be divided by this factor.
% varPathPsfEmission : path of PSF emission image
% varFilePsfEmission : file of PSF emission image
% varExpFactorPSFFieldValue : PSF expansion factor, physical size must be the same as for the image.
% varPathPsfExcitation : path of PSF excitation image
% varFilePsfExcitation : file of PSF excitation image
% varNumItFieldValue : number of iteration
% varWienerParamFieldValue : Wiener filtering parameter
% varShowImages : 1
% varSpeckleperimage : app.SpeckleperimageField.Value = 1
% varOverlapStream : app.OverlapField.Value = 0
% varRegularisationParameter : app.RegularizationparameterSpinner.Value = 0
% varBackupFolder : ''

% nbTotSpeckle = total number of speckle in the stream
% nbImg = number of reconstructed images we can make with the stream
% varSpeckleperimage = number of speckle to reconstruct one image
% speckleMin(1,k) = number of the first speckle of the future reconstructed image
% speckleMax(1,k) = number of the last speckle of the future reconstructed image

numFilt = 3; % needed for otfs calculation
cutFreq = app.CutofffrequencySpinner.Value; % cutoff frequency

baseFileName = tiffFiles(1).name; % name of the first tiff
nbFile = length(tiffFiles);

inputVar2 = cell(1,nbFile);
medVar2 = cell(1,nbFile);

reconTab = cell(1,nbFile);
meanPerImage = cell(1,nbFile);

% ----- IF PREVIEW

if varShowImages == 1
    
    app.BusyLabel.Text = 'Preview in progress';
    drawnow();
    
    img = mLoadImg(baseFileName, [], [], [], 0);
    
    % Image size
    curSize = varExpFactorFieldValue*size(img{1});
    
    % OTFS : 
    [otfs, otfCol, otfIllu, preFilt ] = otfsCalculation(app,varPathPsfEmission, varFilePsfEmission,...
    varExpFactorPSFFieldValue,curSize,varPathPsfExcitation,varFilePsfExcitation,varWienerParamFieldValue,numFilt);
    
    % rimFullProcV2 : show three pictures, one raw speckle image(the first one of img); average of pre-filtered
    % raw image(mean of all image); standard deviation(variance of filted images)

    [ inputVar, medVar ] = rimFullProcV2(img, varExpFactorFieldValue, cutFreq, otfCol, preFilt,varShowImages);
    
    % rimReconNewton
    rimReconNewton( varShowImages, inputVar, otfs, varNumItFieldValue,  varRegularisationParameter, 6, 1e-2, [] );

% ----- NO PREVIEW
else
    
    app.BusyLabel.Text = 'Reconstruction in progress';
    drawnow();
    
    %---- Image size (load only 1st image to get the size) -----------------------------------------------------
    firstImg = mLoadImg([varFolderValue baseFileName],1:1);
    curSize = varExpFactorFieldValue*size(firstImg);
    
    %---- OTFS -------------------------------------------------------------------------------------------------
    t1 = tic;

    [otfs, otfCol, otfIllu, preFilt ] = otfsCalculation(app,varPathPsfEmission, varFilePsfEmission,...
    varExpFactorPSFFieldValue,curSize,varPathPsfExcitation,varFilePsfExcitation,varWienerParamFieldValue,numFilt);
    
    temps = toc(t1);
    s = seconds(temps);
    fprintf ("Calcul otfs %s\n",s);

    %---- Preparation for reconstruction ---------------------------- -------------------------------------------
    t2 = tic;

    [nbImg, speckleMin, speckleMax] = reconstructionMilestones (app, tiffFiles, varFolderValue, varSpeckleperimage, nbFile, varOverlapStream);

    temps = toc(t2);
    s = seconds(temps);
    fprintf ("Preparation %s\n",s); 

    %---- Load et RimFullProcV2 ---------------------------------------------------------------------------------
    app.BusyLabel.Text = 'Step 1/2';
    drawnow();
    t3 = tic;            

    %       On load 1 fichier ou une séquence.
    %       RimFullProcV2 contient une parallélisation sur l'ensemble des speckles de ce fichier ou de cette séquence, ce qui permet d'obtenir l'inputVar rapidemment.
    %        Chaque inputVar est ensuite stocké dans inputVar2.
    
    % If SEQUENTIAL or INTERLEAVED
    if app.ButtonGroup.SelectedObject == app.SequentialButton || app.ButtonGroup.SelectedObject == app.InterleavedButton


        for i = 1:nbFile
            baseFileName = tiffFiles(i).name;
            
            speckleMin_i = speckleMin{1,i};
            speckleMax_i = speckleMax{1,i};
            
            inputVar2_i = cell(1,nbImg(1,i));
            medVar2_i = cell(1,nbImg(1,i));

            parfor k = 1:nbImg(1,i)

                disp(['speckleMin ',num2str(speckleMin_i(1,k))]);
                disp(['speckleMax ',num2str(speckleMax_i(1,k))]);
                
                % On load séquence par séquence
                img = mLoadImg([varFolderValue baseFileName],speckleMin_i(1,k):speckleMax_i(1,k), [], [], 0); % If is FncHdl = 1 : ce qui est retourné dans img ce n'est plus un cell d'image c'est un objet qui s'utilise de la même manière et qui permet de lire l'image dans le disque seulement au moment où on a besoin de l'image. Ici on choisit FncHdl = 0 sinon problème de parfor dans rimFullProcV2

                [ inputVar, medVar ] = rimFullProcV2(img, varExpFactorFieldValue, cutFreq, otfCol, preFilt,varShowImages);
                
                inputVar2_i{1,k} = inputVar;
                medVar2_i{1,k} = medVar;
            end

            inputVar2{1,i} = inputVar2_i;
            medVar2{1,i} = medVar2_i;
        end

    % If FULLFILE
    else
        
        if nbFile <= 5    % under approximatively 5 or less images for is faster than parfor
            for i = 1:nbFile
                
                baseFileName = tiffFiles(i).name;
                
                % On load le fichier entier
                img = mLoadImg([varFolderValue baseFileName], [], [], [], 0); % If is FncHdl = 1 : ce qui est retourné dans img ce n'est plus un cell d'image c'est un objet qui s'utilise de la même manière et qui permet de lire l'image dans le disque seulement au moment où on a besoin de l'image. Ici on choisit FncHdl = 0 sinon problème de parfor dans rimFullProcV2
                
                [ inputVar, medVar ] = rimFullProcV2(img, varExpFactorFieldValue, cutFreq, otfCol, preFilt,varShowImages);
                
                inputVar2{1,i} = inputVar;
                medVar2{1,i} = medVar;
            end
        else
            
            parfor i = 1:nbFile
                
                baseFileName = tiffFiles(i).name;
                
                % On load le fichier entier
                img = mLoadImg([varFolderValue baseFileName], [], [], [], 0); % If is FncHdl = 1 : ce qui est retourné dans img ce n'est plus un cell d'image c'est un objet qui s'utilise de la même manière et qui permet de lire l'image dans le disque seulement au moment où on a besoin de l'image. Ici on choisit FncHdl = 0 sinon problème de parfor dans rimFullProcV2
                
                [ inputVar, medVar ] = rimFullProcV2(img, varExpFactorFieldValue, cutFreq, otfCol, preFilt,varShowImages);
                
                inputVar2{1,i} = inputVar;
                medVar2{1,i} = medVar;
            end
        end
    end

    temps = toc(t3);
    s = seconds(temps);
    fprintf ("Load et RimFullProcV2 %s\n",s);
    
    
    %----- RimReconNewton  ----------------------------------------------------------------------------------
    app.BusyLabel.Text = 'Step 2/2';
    drawnow();
    t4 = tic;

    %       On applique la méthode de Newton sur l'ensemble des fichiers ou des séquences.
    %       Chaque reconstruction boucle dans un for allant jusqu'au nombre d'itération défini

    % If SEQUENTIAL or INTERLEAVED
    if app.ButtonGroup.SelectedObject == app.SequentialButton || app.ButtonGroup.SelectedObject == app.InterleavedButton

        for i = 1:nbFile
            inputVar2_i = inputVar2{1,i};
            medVar2_i = medVar2{1,i};
            
            reconTab_i = cell(1,nbImg(1,i));
            meanPerImage_i = cell(1,nbImg(1,i));

            parfor k = 1:nbImg(1,i)

                [ recon ] = rimReconNewton( varShowImages, inputVar2_i{1,k} , otfs, varNumItFieldValue, varRegularisationParameter, 6, 1e-2 , [] );
                recon = recon .* sqrt(medVar2_i{1,k});
               
                reconTab_i{1,k} = recon;
                meanPerImage_i{1,k} = mean(recon(:));
            end
            
            reconTab{1,i} = reconTab_i;
            meanPerImage{1,i} = meanPerImage_i;
        end
        
        % BACKUP
        for i = 1:nbFile
            baseFileName = tiffFiles(i).name;

            for k = 1:nbImg(1,i)
                backup(app,varBackupFolder, reconTab{1,i}{1,k}, meanPerImage{1,i}{1,k}, baseFileName, k);
            end
        end
        
    % If FULLFILE
    else
        % under approximatively 5 or less images for is faster than parfor
        if nbFile <= 5
            for i = 1:nbFile
                  
                [ recon ] = rimReconNewton( varShowImages, inputVar2{1,i}, otfs, varNumItFieldValue, varRegularisationParameter, 6, 1e-2 , [] );
                recon = recon .* sqrt(medVar2{1,i});
                   
                reconTab{1,i} = recon;
                meanPerImage{1,i} = mean(recon(:));
            end
        else
            parfor i = 1:nbFile
                  
                [ recon ] = rimReconNewton( varShowImages, inputVar2{1,i}, otfs, varNumItFieldValue, varRegularisationParameter, 6, 1e-2 , [] );
                recon = recon .* sqrt(medVar2{1,i});
                   
                reconTab{1,i} = recon;
                meanPerImage{1,i} = mean(recon(:));
            end
        end
        
        % BACKUP
        for i = 1:nbFile
            baseFileName = tiffFiles(i).name;
            backup(app,varBackupFolder, reconTab{1,i}, meanPerImage{1,i}, baseFileName, i);
        end
    end
    
    temps = toc(t4);
    s = seconds(temps);
    fprintf ("RimReconNewton %s\n",s);
end
end