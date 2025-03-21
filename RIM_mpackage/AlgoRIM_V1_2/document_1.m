

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                        matlab.ui.Figure
        WarningArea                     matlab.ui.control.TextArea
        Hyperlink2                      matlab.ui.control.Hyperlink
        Hyperlink                       matlab.ui.control.Hyperlink
        ConditionsofuseButton           matlab.ui.control.Button
        StateAndTime                    matlab.ui.container.Panel
        timeLabel                       matlab.ui.control.Label
        CurrentstateLabel               matlab.ui.control.Label
        BusyLabel                       matlab.ui.control.Label
        Lamp                            matlab.ui.control.Lamp
        Image                           matlab.ui.control.Image
        AcquisitionsoftwareButtonGroup  matlab.ui.container.ButtonGroup
        OtherButton                     matlab.ui.control.RadioButton
        AbbelightButton                 matlab.ui.control.RadioButton
        InscoperButton                  matlab.ui.control.RadioButton
        subtitle                        matlab.ui.control.Label
        StreamGroup                     matlab.ui.container.ButtonGroup
        HelpGlobalFolderButton          matlab.ui.control.Button
        ButtonGroup                     matlab.ui.container.ButtonGroup
        FullFileButton                  matlab.ui.control.RadioButton
        OverlapLabel                    matlab.ui.control.Label
        FilereconstructionmodeLabel     matlab.ui.control.Label
        OverlapField                    matlab.ui.control.NumericEditField
        GapbeforeoverlapLabel           matlab.ui.control.Label
        SpeckleperimageField            matlab.ui.control.NumericEditField
        SpecklespersequenceLabel        matlab.ui.control.Label
        InterleavedButton               matlab.ui.control.RadioButton
        SequentialButton                matlab.ui.control.RadioButton
        OnlyOneFileButton               matlab.ui.control.RadioButton
        MultipleImagesButton            matlab.ui.control.RadioButton
        GlobalfolderButton              matlab.ui.control.RadioButton
        Panel_2                         matlab.ui.container.Panel
        RegularizationparameterSpinner_2  matlab.ui.control.Spinner
        RegularizationparameterSpinner_2Label  matlab.ui.control.Label
        AdjustRFPButton                 matlab.ui.control.Button
        WienerfilteringLabel_2          matlab.ui.control.Label
        expFactorField_2                matlab.ui.control.Spinner
        ImageexpansionfactorLabel_2     matlab.ui.control.Label
        expFactorPSFField_2             matlab.ui.control.Spinner
        PSFexpansionfactorSpinnerLabel_2  matlab.ui.control.Label
        numItField_2                    matlab.ui.control.Spinner
        NumberofiterationsSpinnerLabel_2  matlab.ui.control.Label
        wienerParamField_2              matlab.ui.control.Spinner
        PrefilteringparameterLabel_2    matlab.ui.control.Label
        LaunchpreviewRFPButton          matlab.ui.control.Button
        psfExcitationField_2            matlab.ui.control.EditField
        PSFexcitationLabel_2            matlab.ui.control.Label
        psfEmissionField_2              matlab.ui.control.EditField
        PSFemissionLabel_2              matlab.ui.control.Label
        SelectPsfExcitationButton_2     matlab.ui.control.Button
        SelectPsfEmissionButton_2       matlab.ui.control.Button
        RFPChannel1CheckBox             matlab.ui.control.CheckBox
        commentExpFactorPSF_2           matlab.ui.control.Label
        commentExpFactor_2              matlab.ui.control.Label
        LaunchPanel                     matlab.ui.container.Panel
        CutofffrequencySpinner          matlab.ui.control.Spinner
        CutofffrequencySpinnerLabel     matlab.ui.control.Label
        IntensifysignalbySpinner        matlab.ui.control.Spinner
        IntensifysignalbySpinnerLabel   matlab.ui.control.Label
        LaunchButton                    matlab.ui.control.Button
        Panel                           matlab.ui.container.Panel
        RegularizationparameterSpinner  matlab.ui.control.Spinner
        RegularizationparameterSpinnerLabel  matlab.ui.control.Label
        OnechannelLabel                 matlab.ui.control.Label
        AdjustGFPButton                 matlab.ui.control.Button
        WienerfilteringLabel            matlab.ui.control.Label
        expFactorField                  matlab.ui.control.Spinner
        ImageexpansionfactorLabel       matlab.ui.control.Label
        expFactorPSFField               matlab.ui.control.Spinner
        PSFexpansionfactorSpinnerLabel  matlab.ui.control.Label
        numItField                      matlab.ui.control.Spinner
        NumberofiterationsSpinnerLabel  matlab.ui.control.Label
        wienerParamField                matlab.ui.control.Spinner
        PrefilteringparameterLabel      matlab.ui.control.Label
        LaunchpreviewGFPButton          matlab.ui.control.Button
        psfExcitationField              matlab.ui.control.EditField
        PSFexcitationLabel              matlab.ui.control.Label
        psfEmissionField                matlab.ui.control.EditField
        PSFemissionLabel                matlab.ui.control.Label
        SelectPsfExcitationButton       matlab.ui.control.Button
        SelectPsfEmissionButton         matlab.ui.control.Button
        GFPChannel0CheckBox             matlab.ui.control.CheckBox
        commentExpFactorPSF             matlab.ui.control.Label
        commentExpFactor                matlab.ui.control.Label
        SelectPanel                     matlab.ui.container.Panel
        fileOtherField                  matlab.ui.control.EditField
        SelectFileOtherButton           matlab.ui.control.Button
        SelectFolderOtherButton         matlab.ui.control.Button
        folderOtherField                matlab.ui.control.EditField
        RawimagefolderLabel             matlab.ui.control.Label
        GlobalfolderLabel               matlab.ui.control.Label
        SelectCurFolderButton           matlab.ui.control.Button
        curFolderField                  matlab.ui.control.EditField
        FolderforpreviewLabel           matlab.ui.control.Label
        FileInscoperField               matlab.ui.control.EditField
        InscoperfileEditFieldLabel      matlab.ui.control.Label
        SelectFileInscoperButton        matlab.ui.control.Button
        FileAbbelightField              matlab.ui.control.EditField
        AbbelightfileLabel              matlab.ui.control.Label
        SelectFileAbbelightButton       matlab.ui.control.Button
        SelectFolderAbbelightButton     matlab.ui.control.Button
        FolderAbbelightField            matlab.ui.control.EditField
        RawimagefolderLabel_2           matlab.ui.control.Label
        SelectGlobalFolderButton        matlab.ui.control.Button
        GlobalFolderField               matlab.ui.control.EditField
        RawimagefolderLabel_3           matlab.ui.control.Label
        Image2                          matlab.ui.control.Image


    
   properties (Access = private)
       
      DialogApp;
      DialogApp2;
      
      %overlap = 0;
      pathGlobalFolder;
      pathCurFolder;
      pathFolderAbbelight;
      pathFolderOther;
      errorMessage = '';
      
      fileAbbelight;
      pathFileAbbelight;
      varPathFileAbbelight;
      varFileAbbelight;
      
      fileInscoper;
      pathFileInscoper;
      varPathFileInscoper;
      varFileFileInscoper;
      
      pathPsfEmission;
      varPathPsfEmission;
      filePsfEmission;
      varFilePsfEmission;

      pathFileOther;
      varPathFileOther;
      fileFileOther;
      varFileFileOther;
      
      pathPsfEmission_2;
      varPathPsfEmission_2;
      filePsfEmission_2;
      varFilePsfEmission_2;

      pathPsfExcitation;
      varPathPsfExcitation;
      filePsfExcitation;
      varFilePsfExcitation;

      pathPsfExcitation_2;
      varPathPsfExcitation_2;
      filePsfExcitation_2;
      varFilePsfExcitation_2;

    
    methods (Access = private)

        function reconstruction(app,tiffFiles,varFolderValue,varExpFactorFieldValue,varPathPsfEmission,varFilePsfEmission,varExpFactorPSFFieldValue,varPathPsfExcitation,varFilePsfExcitation,varNumItFieldValue,varWienerParamFieldValue,varShowImages, varSpeckleperimage, varOverlapStream, varRegularisationParameter, varBackupFolder)

            %nbTotSpeckle = total number of speckle in the stream
            %nbImg = number of reconstructed images we can make with the stream
            %varSpeckleperimage = number of speckle to reconstruct one image
            %speckleMin(1,k) = number of the first speckle of the future reconstructed image
            %speckleMax(1,k) = number of the last speckle of the future reconstructed image
            
            numFilt = 3; % needed for otfs calculation
            cutFreq = app.CutofffrequencySpinner.Value;

            baseFileName = tiffFiles(1).name;
            nbFile = length(tiffFiles);
            
            inputVar2 = cell(1,nbFile);
            medVar2 = cell(1,nbFile);
            
            reconTab = cell(1,nbFile);
            meanPerImage = cell(1,nbFile);

% ----- IF PREVIEW

            if varShowImages == 1
                
                app.BusyLabel.Text = 'Preview in progress';
                drawnow();
                
                [img] = loadImgPreview (app, varFolderValue, baseFileName, varSpeckleperimage);
                
                % Image size
                curSize = varExpFactorFieldValue*size(img{1});
                
                % OTFS
                [otfs, otfCol, otfIllu, preFilt ] = otfsCalculation(app,varPathPsfEmission, varFilePsfEmission,varExpFactorPSFFieldValue,curSize,varPathPsfExcitation,varFilePsfExcitation,varWienerParamFieldValue,numFilt);
                
                % rimFullProcV2
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

                [otfs, otfCol, otfIllu, preFilt ] = otfsCalculation(app,varPathPsfEmission, varFilePsfEmission,varExpFactorPSFFieldValue,curSize,varPathPsfExcitation,varFilePsfExcitation,varWienerParamFieldValue,numFilt);
                
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
        
        function [otfs,otfCol,otfIllu,preFilt ] = otfsCalculation(app,varPathPsfEmission, varFilePsfEmission,varExpFactorPSFFieldValue,curSize,varPathPsfExcitation,varFilePsfExcitation,varWienerParamFieldValue,numFilt)
        
            %% PSF collection
            [ otfCol ] = psfToOtf(varPathPsfEmission,varFilePsfEmission,varExpFactorPSFFieldValue,curSize);
            %% PSF excitation
            [ otfIllu ] = psfToOtf(varPathPsfExcitation,varFilePsfExcitation,varExpFactorPSFFieldValue,curSize);
            
            %% OTFCOL et OTFILLU
            % otfs calculation on the first image, not at every iteration
            otfCol   = real( otfCol ); % OTF réelle quand il n'y a pas d'aberration : faut-il le laisser ?
            otfIllu  = real( otfIllu );
            
            % Normalisations
            otfCol  = otfCol  ./ otfCol(1); % OTF collection : représente la manière dont le microscope transforme l'image
            otfIllu = otfIllu ./ mean(otfIllu(:)); % OTF excitation : représente une statistique du speckle
            
            %% PreFilt :
            % Quand on passe dans l'espace fréquentiel, on atténue les hautes fréquences.
            % OTF 2D : a une forme de chapeau chinois : les basses fréquences (en haut du chapeau) ne sont pas atténuée et les hautes fréquences (au bord du chapeau) sont très atténuées. Plus on s'éloigne des basses fréquences, plus le signal est atténué.

            % preFilt essaye de rééquilibrer les hautes fréquences par rapport aux basses fréquences pour compenser cette atténuation. Attention cela peut augmenter le bruit.
            % Plus PreFilt est grand, plus on atténue les hautes fréquences
            % Plus PreFilt est petit, plus on rééquilibre les hautes fréquences par rapport aux basse fréquences (attention : le bruit peut être accentué aussi ! Il faut trouver le juste équilibre)

            preFilt = conj(otfCol) ./ ( abs(otfCol).^2 + varWienerParamFieldValue );
            
            % Normalisation
            preFilt = preFilt ./ preFilt(1);
            
            %% OTFS
            % OTFS : C'est un cell array contenant les filtres. Si on a les même OTFcol et OTFillu on pourait calculer les filtres seulement une fois.
            % Ces filtres permettent ensuite de réaliser le calcul de la variance statistique approchée (+ rapide que le calcul de la variance statistique)
            % Le calcul de l'otfs semble ne pas pouvoir se faire côté GPU
            
            otfs = simFiltersVariance( preFilt.*otfCol, otfIllu , numFilt );
            
        end
        
        function backup(app,varBackupFolder,recon, meanPerImage, baseFileName, i)
            
                % Backup
                app.BusyLabel.Text = 'Backup';
                drawnow();
                %imgdata = uint16((recon ./ meanPerImage) * app.IntensifysignalbySpinner.Value);
                imgdata = uint16((recon * app.IntensifysignalbySpinner.Value));

                if app.ButtonGroup.SelectedObject == app.SequentialButton || app.ButtonGroup.SelectedObject == app.InterleavedButton

                    t = Tiff(strcat(varBackupFolder,strcat(baseFileName,'_',int2str(i),'_recon_AlgoRIM.tif')),'w');
                    
                else
                    t = Tiff(strcat(varBackupFolder,strcat(baseFileName,'_recon_AlgoRIM.tif')),'w');
                    
                end
                tagstruct.ImageLength = size(imgdata,1);
                tagstruct.ImageWidth = size(imgdata,2);
                tagstruct.Photometric = Tiff.Photometric.MinIsBlack;
                tagstruct.BitsPerSample = 16;
                tagstruct.SamplesPerPixel = 1;
                tagstruct.RowsPerStrip = 16;
                tagstruct.PlanarConfiguration = Tiff.PlanarConfiguration.Chunky;
                tagstruct.Software = 'MATLAB';
                setTag(t,tagstruct)
                write(t,imgdata);
                close(t);
                app.BusyLabel.Text = 'Reconstruction in progress';
                drawnow();
        end
        
        function displayGFPPannel(app, show)

            app.psfEmissionField.Visible = show;
            app.PSFemissionLabel.Visible = show;
            app.SelectPsfEmissionButton.Visible = show;
            
            app.psfExcitationField.Visible = show;
            app.PSFexcitationLabel.Visible = show;
            app.SelectPsfExcitationButton.Visible = show;
            
            app.expFactorField.Visible = show;
            app.ImageexpansionfactorLabel.Visible = show;
            app.commentExpFactor.Visible = show;
    
            app.expFactorPSFField.Visible = show;
            app.PSFexpansionfactorSpinnerLabel.Visible = show;
            app.commentExpFactorPSF.Visible = show;
            
            app.numItField.Visible = show;
            app.NumberofiterationsSpinnerLabel.Visible = show;  
        
            app.wienerParamField.Visible = show;
            app.PrefilteringparameterLabel.Visible = show;
            app.WienerfilteringLabel.Visible = show;
            app.AdjustGFPButton.Visible = show;
            
            app.RegularizationparameterSpinner.Visible = show;
            app.RegularizationparameterSpinnerLabel.Visible = show;
            
            app.LaunchpreviewGFPButton.Visible = show;
        end
        
        function displayRFPPannel(app, show)
            
            app.psfEmissionField_2.Visible = show;
            app.PSFemissionLabel_2.Visible = show;
            app.SelectPsfEmissionButton_2.Visible = show;
            
            app.psfExcitationField_2.Visible = show;
            app.PSFexcitationLabel_2.Visible = show;
            app.SelectPsfExcitationButton_2.Visible = show;

            app.expFactorField_2.Visible = show;
            app.ImageexpansionfactorLabel_2.Visible = show;
            app.commentExpFactor_2.Visible = show;
    
            app.expFactorPSFField_2.Visible = show;
            app.PSFexpansionfactorSpinnerLabel_2.Visible = show;
            app.commentExpFactorPSF_2.Visible = show;
            
            app.numItField_2.Visible = show;
            app.NumberofiterationsSpinnerLabel_2.Visible = show;  
        
            app.wienerParamField_2.Visible = show;
            app.PrefilteringparameterLabel_2.Visible = show;
            app.WienerfilteringLabel_2.Visible = show;
            app.AdjustRFPButton.Visible = show;
            
            app.RegularizationparameterSpinner_2.Visible = show;
            app.RegularizationparameterSpinner_2Label.Visible = show;
                
            app.LaunchpreviewRFPButton.Visible = show;
        end
        
        function displayFolderAbbelight(app, show)
            
            app.FolderAbbelightField.Visible = show;
            app.RawimagefolderLabel_2.Visible = show;
            app.SelectFolderAbbelightButton.Visible = show;
        end

        function displayFileAbbelight(app, show)
            
            app.FileAbbelightField.Visible = show;
            app.AbbelightfileLabel.Visible = show;
            app.SelectFileAbbelightButton.Visible = show;
        end

        function displayFolderOther(app, show)
            
            app.folderOtherField.Visible = show;
            app.RawimagefolderLabel.Visible = show;
            app.SelectFolderOtherButton.Visible = show;
        end
        
        function displayFileOther(app, show)
            
            app.fileOtherField.Visible = show;
            app.SelectFileOtherButton.Visible = show;
        end
        
        function displayFolderInscoper(app, show)
            
            app.GlobalFolderField.Visible = show;
            app.SelectGlobalFolderButton.Visible = show;
        end                
                
        function displayFileInscoper(app, show)
            
            app.FileInscoperField.Visible = show;
            app.InscoperfileEditFieldLabel.Visible = show;
            app.SelectFileInscoperButton.Visible = show;
        end
        
        function displayPreviewInscoper(app, show) % Global folder preview Inscoper
            
            app.curFolderField.Visible = show;
            app.FolderforpreviewLabel.Visible = show;
            app.SelectCurFolderButton.Visible = show;
        end

        function displayInterleaved(app, show)
            
            app.OverlapField.Value = 0;
            app.OverlapField.Visible = show;
            app.GapbeforeoverlapLabel.Visible = show;
            app.OverlapLabel.Visible = show;
        end
        
        function displaySequential(app, show)
            
            app.SpeckleperimageField.Visible = show;
            app.SpecklespersequenceLabel.Visible = show;
        end
        
        function [img] = loadImgPreview (app, varFolderValue, baseFileName, varSpeckleperimage)
            
            % If SEQUENTIAL or INTERLEAVED
            if app.ButtonGroup.SelectedObject == app.SequentialButton || app.ButtonGroup.SelectedObject == app.InterleavedButton
                
                %% Faire preview sur les speckles du milieu
                info = imfinfo( [varFolderValue baseFileName], 'tif' );
                nbTotSpeckle = numel(info); % total number of speckle
                
                disp(['Total number of speckle = ', num2str(nbTotSpeckle)]);
                disp(['Speckle per sequence = ', num2str(varSpeckleperimage)]);

                if varSpeckleperimage > nbTotSpeckle
                    app.errorMessage = strcat(app.errorMessage, 'Too many speckles per sequence');
                else
                    if nbTotSpeckle == varSpeckleperimage
                        nb1stSpecklePreview = 1;
                        nbLastSpecklePreview = nbTotSpeckle;
                    else
                        nb1stSpecklePreview = floor((nbTotSpeckle - varSpeckleperimage) / 2); %% ATTENTION SEQUENCE DE 199 pour nb tot de 200 1st sepck = 0 !!
                        
                        if nb1stSpecklePreview == 0
                            nb1stSpecklePreview = 1;
                            nbLastSpecklePreview = varSpeckleperimage;
                        else
                            nbLastSpecklePreview = nb1stSpecklePreview + (varSpeckleperimage - 1);
                        end
                    end

                    disp(['1st speckle preview = ', num2str(nb1stSpecklePreview)]);
                    disp(['Last speckle preview = ', num2str(nbLastSpecklePreview)]);

                    img = mLoadImg([varFolderValue baseFileName], nb1stSpecklePreview:nbLastSpecklePreview, [], [], 0);
                end
                
            % IF FULLFILE   
            else
                img = mLoadImg([varFolderValue baseFileName], [], [], [], 0);
            end
        end
        
        function [nbImg, speckleMin, speckleMax] = reconstructionMilestones(app, tiffFiles, varFolderValue, varSpeckleperimage, nbFile, varOverlapStream)
            
            if app.ButtonGroup.SelectedObject == app.SequentialButton || app.ButtonGroup.SelectedObject == app.InterleavedButton
                
                nbImg = zeros(1,nbFile);
                speckleMin = cell(1,nbFile);
                speckleMax = cell(1,nbFile);

                for i = 1:nbFile

                    baseFileName = tiffFiles(i).name;
                    info = imfinfo( [varFolderValue baseFileName] , 'tif');
                    nbTotSpeckle = numel(info); % total number of speckle
                    
                    disp(['Total number of speckle = ', num2str(nbTotSpeckle)]);
                    disp(['Speckle per sequence = ', num2str(varSpeckleperimage)]);
                
                    if varSpeckleperimage > nbTotSpeckle
                        app.errorMessage = strcat(app.errorMessage, 'Too many speckles per sequence');
                        break;
                    end
                    
                    % nbImg
                    if varOverlapStream == 0
                        nbImg(1,i) = floor(nbTotSpeckle / varSpeckleperimage); %Round down
                    else
                        nbImg(1,i) = floor((nbTotSpeckle - (varSpeckleperimage + 1)) / varOverlapStream) + 1;
                    end
                    disp(['Number of reconstructed files = ', num2str(nbImg(1,i))]);
                    
                    % speckleMin, speckleMax
                    speckleMin{1,i}(1,1) = 1;
                    speckleMax{1,i}(1,1) = varSpeckleperimage;

                    if app.ButtonGroup.SelectedObject == app.SequentialButton
                        
                        for k = 2:nbImg(1,i)
                            speckleMin{1,i}(1,k) = speckleMin{1,i}(1,k-1) + varSpeckleperimage;
                            speckleMax{1,i}(1,k) = speckleMax{1,i}(1,k-1) + varSpeckleperimage;
                        end
                        
                    elseif app.ButtonGroup.SelectedObject == app.InterleavedButton
                        
                        for k = 2:nbImg(1,i)
                            speckleMin{1,i}(1,k) = speckleMin{1,i}(1,k-1) + varOverlapStream;
                            speckleMax{1,i}(1,k) = speckleMin{1,i}(1,k) + varSpeckleperimage;
                        end
                    end
                end
                
            % IF FULLFILE
            else
                nbImg = nbFile;
                disp(['Number of reconstructed files = ', num2str(nbFile)]);

                speckleMin = [];
                speckleMax = [];
            end
        end


   

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            
            try
                load('backup.mat','state');
                
                app.curFolderField.Value = state.curFolderField.Value;
                app.GlobalFolderField.Value = state.GlobalFolderField.Value;
                app.FolderAbbelightField.Value = state.FolderAbbelightField.Value;
                app.folderOtherField.Value = state.folderOtherField.Value;
                app.CutofffrequencySpinner.Value = state.CutofffrequencySpinner.Value;

            catch 
            end
            
            % Inscoper File
            try
                app.varPathFileInscoper.Value = state.varPathFileInscoper.Value;
                app.varFileFileInscoper.Value = state.varFileFileInscoper.Value;
                app.FileInscoperField.Value = state.FileInscoperField.Value;
            catch
            end
            if isempty(app.varPathFileInscoper) == 0 % if path to file already exist, users may be won't use the select button. So values need to be initialized.
                 app.pathFileInscoper = app.varPathFileInscoper.Value;
                 app.fileInscoper = app.varFileFileInscoper.Value;
            end
  
            
            % Abbelight File
            try
                app.varPathFileAbbelight.Value = state.varPathFileAbbelight.Value;
                app.varFileAbbelight.Value = state.varFileAbbelight.Value;
                app.FileAbbelightField.Value = state.FileAbbelightField.Value;
            catch
            end
            if isempty(app.varPathFileAbbelight) == 0 % if path to file already exist, users may be won't use the select button. So values need to be initialized.
                 app.pathFileAbbelight = app.varPathFileAbbelight.Value;
                 app.fileAbbelight = app.varFileAbbelight.Value;
            end
  
  
            % File Other
            try
                app.varPathFileOther.Value = state.varPathFileOther.Value;
                app.varFileFileOther.Value = state.varFileFileOther.Value;
                app.fileOtherField.Value = state.fileOtherField.Value;
            catch
            end
            if isempty(app.varPathFileOther) == 0 % if path to file already exist, users may be won't use the select button. So values need to be initialized.
                 app.pathFileOther = app.varPathFileOther.Value;
                 app.fileFileOther = app.varFileFileOther.Value;
            end
            
            % PSF Emission File 
            try
                app.varPathPsfEmission.Value = state.varPathPsfEmission.Value;
                app.varFilePsfEmission.Value = state.varFilePsfEmission.Value;
                app.psfEmissionField.Value = state.psfEmissionField.Value;
            catch
            end
            if isempty(app.varPathPsfEmission) == 0 % if path to file already exist, users may be won't use the select button. So values need to be initialized.
                 app.pathPsfEmission = app.varPathPsfEmission.Value;
                 app.filePsfEmission = app.varFilePsfEmission.Value;
            end
            
            % PSF Excitation File
            try
                app.varPathPsfExcitation.Value = state.varPathPsfExcitation.Value;
                app.varFilePsfExcitation.Value = state.varFilePsfExcitation.Value;
                app.psfExcitationField.Value = state.psfExcitationField.Value;
            catch
            end
            if isempty(app.varPathPsfExcitation) == 0 % if path to file already exist, users may be won't use the select button. So values need to be initialized.
                 app.pathPsfExcitation = app.varPathPsfExcitation.Value;
                 app.filePsfExcitation = app.varFilePsfExcitation.Value;
            end
            
            % PSF Emission 2 File 
            try
                app.varPathPsfEmission_2.Value = state.varPathPsfEmission_2.Value;
                app.varFilePsfEmission_2.Value = state.varFilePsfEmission_2.Value;
                app.psfEmissionField_2.Value = state.psfEmissionField_2.Value;
            catch
            end
            if isempty(app.varPathPsfEmission_2) == 0 % if path to file already exist, users may be won't use the select button. So values need to be initialized.
                 app.pathPsfEmission_2 = app.varPathPsfEmission_2.Value;
                 app.filePsfEmission_2 = app.varFilePsfEmission_2.Value;
            end
            
            % PSF Excitation 2 File
            try
                app.varPathPsfExcitation_2.Value = state.varPathPsfExcitation_2.Value;
                app.varFilePsfExcitation_2.Value = state.varFilePsfExcitation_2.Value;
                app.psfExcitationField_2.Value = state.psfExcitationField_2.Value;
            catch
            end
            if isempty(app.varPathPsfExcitation_2) == 0 % if path to file already exist, users may be won't use the select button. So values need to be initialized.
                 app.pathPsfExcitation_2 = app.varPathPsfExcitation_2.Value;
                 app.filePsfExcitation_2 = app.varFilePsfExcitation_2.Value;
            end
            
        end

        % Button pushed function: LaunchButton
        function LaunchButtonPushed(app, event)
            close all;
            clc;
            
            
%             varFolderValue                Chemin vers le dossier des images brutes
%             varBackupFolder               Chemin vers le dossier de sauvegarde des images reconstruites

%             varExpFactorFieldValue        Facteur d'expansion
                    % A taille de pixels physiques équivalents, En général l'otf est trop étendue et on veut qu'elle prenne seulement la moitié de l'image.
                    % Donc numériquement on rajoute des pixels après l'acquisition  : zero padding on rajoute des pixels dans l'espace de Fourier.
                    % ExpFact élevé diminue la taille des pixels physiques. C'est pour avoir la place de stocker l'information que l'on crée grâce à l'algo.

%             varExpFactorPSFFieldValue ??

%             varWienerParamFieldValue      Paramètre du prefiltrage (Wiener)
                    % Permet de déconvoluer les images, 1ère étape du processus de reconstruction. Il concentre l'information dans l'image de variance. Rend la deconvolution plus ou moins lisse mais il faut trouver l'équilibre entre "lisser" et perdre les hautes fréquences. Plus il est grand plus ça lisse. Il faut le manipuler selon une échelle log (pour trouver le bon ordre de grandeur).

%             cutFreq = app.CutofffrequencySpinner.Value;       Fréquence de coupure
                    % Formule : (2 x NA x pixelSize) / lambda;
                    % Représentation : C'est le rayon de l'OTF;
                    % Valeur : Si elle est égale à 0.5 alors l'OTF touche les bords de l'image. Il faut donc qu'elle soit < 0,5 sinon problème de repliement spectral. (Si on touche les bords ça signifie qu'on perd de l'information.) 

%             numFilt                       Nombre de filtres
                    % eng: Number of filters (K) used in the approximation of the statistical variance.  V ~= sum_k( | M_k rho |^2 )    for k = 1 to K
                    % fr: Contrôle l'approximation de la qualité du calcul de la variance statistique.
                    % Valeur: Plus il y a de filtres plus on s'approche d'un résultat précis mais plus les calculs sont longs
                    % numFilt = 3;
            
%             varNumItFieldValue            Nombre d'itération de l'algorithme de minimisation

%             varRegularisationParameter    Paramètre de régularisation
                    % Rend la reconstruction plus ou moins lisse mais il faut trouver l'équilibre entre "lisser" et perdre les hautes fréquences. Plus il est grand plus ça lisse. Il faut le manipuler selon une échelle log (pour trouver le bon ordre de grandeur).

%             varShowImages                 Paramètre précisant si l'on veut lancer une preview.
                    % Valeur : Preview = 1, pas de preview = 0

%             varPathPsfEmission, varFilePsfEmission        PSF emission : objet = échantillon
                    % PSF simulée (théorique) ou expérimentale ( expérimentalement on utilise des billes toutes petites ). Cette PSF est sensible aux abberations.
   
%             varPathPsfExcitation, varFilePsfExcitation    PSF excitation : objet = speckle
                    % PSF simulée (théorique):
                    % Le speckle avant le microscope est un ensemble de points très petits, nombreux et répartis de manière aléatoire.
                    % Cette illumination est insensible aux abbérations du système optique.
                    % Après l'objectif, au niveau de l'objet, le speckle est un ensemble de grains un peu étalés. L'autocorrelation de ces speckles est égale à la psf d'excitation.


            % User experience
            app.Lamp.Enable='on';
            app.Lamp.Color='red';
            app.BusyLabel.Visible='on';
            app.timeLabel.Visible='off';
            app.LaunchButton.Enable = 'off';
            app.WarningArea.Value = '';
            app.errorMessage = '';
            app.BusyLabel.Text = 'Busy';
            drawnow();
            tStart = tic;
            
            %% You can't use app.variables in parfor so you need to declare local variables

            % No preview
            varShowImages=0;

            % Sequential or interleaved analysis
            varSpeckleperimage = 0;
            varOverlapStream = app.OverlapField.Value;
            
            disp('overlap');
            disp(varOverlapStream);
            
            if app.ButtonGroup.SelectedObject == app.SequentialButton || app.ButtonGroup.SelectedObject == app.InterleavedButton
                varSpeckleperimage = app.SpeckleperimageField.Value;
            end
            
            % INSCOPER
            if app.AcquisitionsoftwareButtonGroup.SelectedObject == app.InscoperButton
                
                try
                    % Stream File and RAW_DATA folder selections are the only way to find directly the working environnement without making a loop to study subfolders.
                    
                    % GLOBAL FOLDER OR FULL FILE
                    % IF work on a folder
                   if app.StreamGroup.SelectedObject ~= app.OnlyOneFileButton
                        
                        % This code allows to launch AlgoRIM on all subfolders contained in a Global Folder or only on one of its subfolders
                        folders = dir(app.GlobalFolderField.Value); % list files and folders
                        folders = folders(~ismember({folders.name},{'.','..'})); % remove '.' and '..'
                        dirFlags = [folders.isdir]; % select only folders not files
                        folders = folders(dirFlags);
                        lengthFolders = length(folders);
                        foundFolder = 0;
                        
                        if endsWith(app.GlobalFolderField.Value, '/RAW_DATA/') == 1 % if path ends with RAW_DATA, it means that your path points RAW_DATA folder
                            varFolderValue = app.GlobalFolderField.Value;
                            varBackupFolder = erase(varFolderValue, 'RAW_DATA/');
                            foundFolder = 1;
                            lengthFolders = 1;
                        end
                   
                   else % If your path points a file
                        foundFolder = 1;
                        lengthFolders = 1;
                        varFolderValue = app.pathFileInscoper;
                        varBackupFolder = app.pathFileInscoper;
                    end
                    
                    if lengthFolders == 0
                        app.errorMessage = strcat(app.errorMessage, 'Missing path to raw images');
                    end
                    
                    for n = 1 : lengthFolders
                        
                        % BACKUP for Global Folder reconstruction
                        if foundFolder == 0
                            if endsWith(app.GlobalFolderField.Value, '/images/') == 1 % If path ends with /images/, it means that your path points images folder
                                varFolderValue = strcat(app.GlobalFolderField.Value, '/RAW_DATA/');
                                varBackupFolder = app.GlobalFolderField.Value;
                            
                            elseif strcmp(folders(n).name, 'images') == 1 % if subfolder is 'images', it means that your path points one subfolder
                                varFolderValue = strcat(app.GlobalFolderField.Value,folders(n).name,'/RAW_DATA/');
                                varBackupFolder = erase(varFolderValue, 'RAW_DATA/');
        
                            elseif strcmp(folders(n).name, 'images') == 0 % if subfolder is not 'images', it means that your path points a global folder
                                varFolderValue = strcat(app.GlobalFolderField.Value,folders(n).name,'/images/RAW_DATA/');
                                varBackupFolder = erase(varFolderValue, 'RAW_DATA/');
                            end
                        end
                        
                        % CHANNEL 0 PARAMETERS
                        if app.GFPChannel0CheckBox.Value==1
                            
                            % PSF Emission
                            varPathPsfEmission1=[strrep(app.pathPsfEmission,'\','/'),'/'];
                            varFilePsfEmission1=app.filePsfEmission;
                            if isempty(varFilePsfEmission1) == 1 && n == 1 % empty path
                                app.errorMessage = strcat(app.errorMessage, ' / Missing c0 Emission PSF');
                            end
                            
                            % PSF excitation
                            varPathPsfExcitation1=[strrep(app.pathPsfExcitation,'\','/'),'/'];
                            varFilePsfExcitation1=app.filePsfExcitation;
                            if isempty(varFilePsfExcitation1) == 1 && n == 1
                                app.errorMessage = strcat(app.errorMessage, ' / Missing c0 Excitation PSF');
                            end

                            % Numeric parameters
                            varExpFactorFieldValue1=app.expFactorField.Value;
                            varExpFactorPSFFieldValue1=app.expFactorPSFField.Value;
                            varNumItFieldValue1=app.numItField.Value;
                            varWienerParamFieldValue1=app.wienerParamField.Value;
                            varRegularisationParameter1=app.RegularizationparameterSpinner.Value;

                            % IF ONLY ONE FILE CHECK CHANNEL    
                            if app.StreamGroup.SelectedObject == app.OnlyOneFileButton
                                if isempty(strfind(app.fileInscoper,'c0')) == 0 && isempty(strfind(app.fileInscoper,'.tif')) == 0
                                    tiffFiles1 = dir(strcat(varFolderValue,app.fileInscoper)) ; % dir list the contents of a folder   
                                else
                                    app.errorMessage = strcat(app.errorMessage, ' / Channel 0 (*c0*.tif) not found in file name');
                                end
                            else
                                filepattern = fullfile(varFolderValue, '*c0*.tif');
                                tiffFiles1 = dir(filepattern); % list the contents of a folder
                            end
                            
                            if isempty(tiffFiles1) == 1 && n == 1  && app.RFPChannel1CheckBox.Value == 0
                                app.errorMessage = strcat(app.errorMessage, ' / Incorrect path to access raw images (model : folder/sub_folder/images/RAW_DATA/)');
                            end
                        end
                        
                        % CHANNEL 1 PARAMETERS
                        if app.RFPChannel1CheckBox.Value==1
                            
                            % PSF Emission
                            varPathPsfEmission2=[strrep(app.pathPsfEmission_2,'\','/'),'/'];
                            varFilePsfEmission2=app.filePsfEmission_2;
                            if isempty(varFilePsfEmission2) == 1  && n == 1
                                app.errorMessage = strcat(app.errorMessage, ' / Missing c1 Emission PSF');
                            end
                            
                            % PSF excitation
                            varPathPsfExcitation2=[strrep(app.pathPsfExcitation_2,'\','/'),'/'];
                            varFilePsfExcitation2=app.filePsfExcitation_2;
                            if isempty(varFilePsfExcitation2) == 1  && n == 1
                                app.errorMessage = strcat(app.errorMessage, ' / Missing c1 Excitation PSF');
                            end
                            
                            % Numeric parameters
                            varExpFactorFieldValue2=app.expFactorField_2.Value;
                            varExpFactorPSFFieldValue2=app.expFactorPSFField_2.Value;
                            varNumItFieldValue2=app.numItField_2.Value;
                            varWienerParamFieldValue2=app.wienerParamField_2.Value;         
                            varRegularisationParameter2=app.RegularizationparameterSpinner_2.Value;
                            
                            % IF ONLY ONE FILE CHECK CHANNEL    
                            if app.StreamGroup.SelectedObject == app.OnlyOneFileButton
                                if isempty(strfind(app.fileInscoper,'c1')) == 0 && isempty(strfind(app.fileInscoper,'.tif')) == 0
                                    tiffFiles2 = dir(strcat(varFolderValue,app.fileInscoper)) ; % dir list the contents of a folder                          
                                else
                                    app.errorMessage = strcat(app.errorMessage, ' / Channel 1 (*c1*.tif) not found in file name');
                                end
                            else
                                filepattern = fullfile(varFolderValue, '*c1*.tif');
                                tiffFiles2 = dir(filepattern); % list the contents of a folder
                            end
                            
                            if isempty(tiffFiles2) == 1 && n == 1
                                app.errorMessage = strcat(app.errorMessage, ' / Incorrect path to access raw images (model : folder/sub_folder/images/RAW_DATA/)');
                            end
                        end
                        
                                                                       
                        % CREATE BACKUP FOLDER IN '/images'
                        if app.GFPChannel0CheckBox.Value == 1 && app.RFPChannel1CheckBox.Value == 1
                            
                           if app.StreamGroup.SelectedObject ~= app.OnlyOneFileButton

                               if app.ButtonGroup.SelectedObject == app.SequentialButton
                                 folderName = strcat('AlgoRIM_C0_it_',num2str(app.numItField.Value),'_w_',strrep(num2str(app.wienerParamField.Value),'.','p'),'_r_',strrep(num2str(varRegularisationParameter1),'.','p'),'_speckles_',num2str(app.SpeckleperimageField.Value),'_C1_it_',num2str(app.numItField_2.Value),'_w_',strrep(num2str(app.wienerParamField_2.Value),'.','p'),'_r_',strrep(num2str(varRegularisationParameter2),'.','p'),'_speckles_',num2str(app.SpeckleperimageField.Value),'/');

                               elseif app.ButtonGroup.SelectedObject == app.InterleavedButton
                                  folderName = strcat('AlgoRIM_C0_it_',num2str(app.numItField.Value),'_w_',strrep(num2str(app.wienerParamField.Value),'.','p'),'_r_',strrep(num2str(varRegularisationParameter1),'.','p'),'_speckles_',num2str(app.SpeckleperimageField.Value),'_overlap_',num2str(app.OverlapField.Value),'_C1_it_',num2str(app.numItField_2.Value),'_w_',strrep(num2str(app.wienerParamField_2.Value),'.','p'),'_r_',strrep(num2str(varRegularisationParameter2),'.','p'),'_speckles_',num2str(app.SpeckleperimageField.Value),'_overlap_',num2str(app.OverlapField.Value),'/');

                               else
                                  folderName = strcat('AlgoRIM_C0_it_',num2str(app.numItField.Value),'_w_',strrep(num2str(app.wienerParamField.Value),'.','p'),'_r_',strrep(num2str(varRegularisationParameter1),'.','p'),'_C1_it_',num2str(app.numItField_2.Value),'_w_',strrep(num2str(app.wienerParamField_2.Value),'.','p'),'_r_',strrep(num2str(varRegularisationParameter2),'.','p'),'/');
                               end
                            
                           else % A file can only have one channel
                                app.WarningArea.Value = '/ Choose only one channel for your file';
                           end

                            if app.ButtonGroup.SelectedObject == app.SequentialButton
                                varBackupFolderC0 = strcat(varBackupFolder,folderName,'Channel_C0_it_',num2str(app.numItField.Value),'_w_',strrep(num2str(app.wienerParamField.Value),'.','p'),'_r_',strrep(num2str(varRegularisationParameter1),'.','p'),'_speckles_',num2str(app.SpeckleperimageField.Value),'/');
                                varBackupFolderC1 = strcat(varBackupFolder,folderName,'Channel_C1_it_',num2str(app.numItField_2.Value),'_w_',strrep(num2str(app.wienerParamField_2.Value),'.','p'),'_r_',strrep(num2str(varRegularisationParameter2),'.','p'),'_speckles_',num2str(app.SpeckleperimageField.Value),'/');
                                
                            elseif app.ButtonGroup.SelectedObject == app.InterleavedButton
                                varBackupFolderC0 = strcat(varBackupFolder,folderName,'Channel_C0_it_',num2str(app.numItField.Value),'_w_',strrep(num2str(app.wienerParamField.Value),'.','p'),'_r_',strrep(num2str(varRegularisationParameter1),'.','p'),'_speckles_',num2str(app.SpeckleperimageField.Value),'_overlap_',num2str(app.OverlapField.Value),'/');
                                varBackupFolderC1 = strcat(varBackupFolder,folderName,'Channel_C1_it_',num2str(app.numItField_2.Value),'_w_',strrep(num2str(app.wienerParamField_2.Value),'.','p'),'_r_',strrep(num2str(varRegularisationParameter2),'.','p'),'_speckles_',num2str(app.SpeckleperimageField.Value),'_overlap_',num2str(app.OverlapField.Value),'/');
                                
                            else
                                varBackupFolderC0 = strcat(varBackupFolder,folderName,'Channel_C0_it_',num2str(app.numItField.Value),'_w_',strrep(num2str(app.wienerParamField.Value),'.','p'),'_r_',strrep(num2str(varRegularisationParameter1),'.','p'),'/');
                                varBackupFolderC1 = strcat(varBackupFolder,folderName,'Channel_C1_it_',num2str(app.numItField_2.Value),'_w_',strrep(num2str(app.wienerParamField_2.Value),'.','p'),'_r_',strrep(num2str(varRegularisationParameter2),'.','p'),'/');
                            end

                            if ~exist(strcat(varBackupFolder,folderName), 'dir')
                                mkdir(varBackupFolder,folderName);
                                
                                if app.ButtonGroup.SelectedObject == app.SequentialButton
                                    mkdir([varBackupFolder,folderName], strcat('Channel_C0_it_',num2str(app.numItField.Value),'_w_',strrep(num2str(app.wienerParamField.Value),'.','p'),'_r_',strrep(num2str(varRegularisationParameter1),'.','p'),'_speckles_',num2str(app.SpeckleperimageField.Value)));
                                    mkdir([varBackupFolder,folderName], strcat('Channel_C1_it_',num2str(app.numItField_2.Value),'_w_',strrep(num2str(app.wienerParamField_2.Value),'.','p'),'_r_',strrep(num2str(varRegularisationParameter2),'.','p'),'_speckles_',num2str(app.SpeckleperimageField.Value)));
                                    
                                elseif app.ButtonGroup.SelectedObject == app.InterleavedButton
                                    mkdir([varBackupFolder,folderName], strcat('Channel_C0_it_',num2str(app.numItField.Value),'_w_',strrep(num2str(app.wienerParamField.Value),'.','p'),'_r_',strrep(num2str(varRegularisationParameter1),'.','p'),'_speckles_',num2str(app.SpeckleperimageField.Value),'_overlap_',num2str(app.OverlapField.Value)));
                                    mkdir([varBackupFolder,folderName], strcat('Channel_C1_it_',num2str(app.numItField_2.Value),'_w_',strrep(num2str(app.wienerParamField_2.Value),'.','p'),'_r_',strrep(num2str(varRegularisationParameter2),'.','p'),'_speckles_',num2str(app.SpeckleperimageField.Value),'_overlap_',num2str(app.OverlapField.Value)));
                               
                                else
                                    mkdir([varBackupFolder,folderName], strcat('Channel_C0_it_',num2str(app.numItField.Value),'_w_',strrep(num2str(app.wienerParamField.Value),'.','p'),'_r_',strrep(num2str(varRegularisationParameter1),'.','p')));
                                    mkdir([varBackupFolder,folderName], strcat('Channel_C1_it_',num2str(app.numItField_2.Value),'_w_',strrep(num2str(app.wienerParamField_2.Value),'.','p'),'_r_',strrep(num2str(varRegularisationParameter2),'.','p')));
                                end
                            end
                            
                        elseif app.GFPChannel0CheckBox.Value == 0 && app.RFPChannel1CheckBox.Value == 1

                            if app.ButtonGroup.SelectedObject == app.SequentialButton
                                folderName = strcat('AlgoRIM_C1_it_',num2str(app.numItField_2.Value),'_w_',strrep(num2str(app.wienerParamField_2.Value),'.','p'),'_r_',strrep(num2str(varRegularisationParameter2),'.','p'),'_speckles_',num2str(app.SpeckleperimageField.Value),'/');
                            elseif app.ButtonGroup.SelectedObject == app.InterleavedButton
                                folderName = strcat('AlgoRIM_C1_it_',num2str(app.numItField_2.Value),'_w_',strrep(num2str(app.wienerParamField_2.Value),'.','p'),'_r_',strrep(num2str(varRegularisationParameter2),'.','p'),'_speckles_',num2str(app.SpeckleperimageField.Value),'_overlap_',num2str(app.OverlapField.Value),'/');
                            else
                                folderName = strcat('AlgoRIM_C1_it_',num2str(app.numItField_2.Value),'_w_',strrep(num2str(app.wienerParamField_2.Value),'.','p'),'_r_',strrep(num2str(varRegularisationParameter2),'.','p'),'/');
                            end
                            if ~exist(strcat(varBackupFolder,folderName), 'dir')
                                mkdir(varBackupFolder,folderName);
                            end
                            
                        elseif app.GFPChannel0CheckBox.Value == 1 && app.RFPChannel1CheckBox.Value == 0

                            if app.ButtonGroup.SelectedObject == app.SequentialButton
                                folderName = strcat('AlgoRIM_C0_it_',num2str(app.numItField.Value),'_w_',strrep(num2str(app.wienerParamField.Value),'.','p'),'_r_',strrep(num2str(varRegularisationParameter1),'.','p'),'_speckles_',num2str(app.SpeckleperimageField.Value),'/');
                            elseif app.ButtonGroup.SelectedObject == app.InterleavedButton
                                folderName = strcat('AlgoRIM_C0_it_',num2str(app.numItField.Value),'_w_',strrep(num2str(app.wienerParamField.Value),'.','p'),'_r_',strrep(num2str(varRegularisationParameter1),'.','p'),'_speckles_',num2str(app.SpeckleperimageField.Value),'_overlap_',num2str(app.OverlapField.Value),'/');
                            else
                                folderName = strcat('AlgoRIM_C0_it_',num2str(app.numItField.Value),'_w_',strrep(num2str(app.wienerParamField.Value),'.','p'),'_r_',strrep(num2str(varRegularisationParameter1),'.','p'),'/');
                            end
                            if ~exist(strcat(varBackupFolder,folderName), 'dir')
                                mkdir(varBackupFolder,folderName);
                            end
                        end
                        
                        % CHANNEL 0 RECONSTRUCTION
                        if app.GFPChannel0CheckBox.Value==1
                            
                            if app.GFPChannel0CheckBox.Value == 1 && app.RFPChannel1CheckBox.Value == 1 % Create backup subfolders for each channel
                                varBackupFolder = varBackupFolderC0;
                            else
                                varBackupFolder = strcat(varBackupFolder,folderName);
                            end
                            reconstruction(app,tiffFiles1,varFolderValue,varExpFactorFieldValue1,varPathPsfEmission1,varFilePsfEmission1,varExpFactorPSFFieldValue1,varPathPsfExcitation1,varFilePsfExcitation1,varNumItFieldValue1,varWienerParamFieldValue1,varShowImages, varSpeckleperimage, varOverlapStream, varRegularisationParameter1, varBackupFolder);
                        end
                        
                        % CHANNEL 1 RECONSTRUCTION
                        if app.RFPChannel1CheckBox.Value==1
                            
                            if app.GFPChannel0CheckBox.Value == 1 && app.RFPChannel1CheckBox.Value == 1 % Create backup subfolders for each channel
                                varBackupFolder = varBackupFolderC1;
                            else
                                varBackupFolder = strcat(varBackupFolder,folderName);
                            end
                            
                            reconstruction(app,tiffFiles2,varFolderValue,varExpFactorFieldValue2,varPathPsfEmission2,varFilePsfEmission2,varExpFactorPSFFieldValue2,varPathPsfExcitation2,varFilePsfExcitation2,varNumItFieldValue2,varWienerParamFieldValue2,varShowImages, varSpeckleperimage, varOverlapStream, varRegularisationParameter2, varBackupFolder);
                        end
                        
                        if app.GFPChannel0CheckBox.Value == 0 && app.RFPChannel1CheckBox.Value == 0  && n == 1
                            app.errorMessage = strcat(app.errorMessage, ' / Select at least one channel');
                        end
                    end
                         
                    if isempty(app.errorMessage) == 0
                        app.WarningArea.Value = app.errorMessage;
                    end

                catch
                    if isempty(app.errorMessage) == 0
                        app.WarningArea.Value = app.errorMessage;
                    else
                        app.WarningArea.Value = 'Error. Please check paths and parameters.';
                    end
                end
               

            % ABBELIGHT   
            elseif app.AcquisitionsoftwareButtonGroup.SelectedObject == app.AbbelightButton
                
                 try
                    % RAW DATA FOLDER 
                    % IF work on a folder
                    if app.StreamGroup.SelectedObject ~= app.OnlyOneFileButton

                        varFolderValue = app.FolderAbbelightField.Value;
                        if isempty(varFolderValue) == 1
                            app.errorMessage = strcat(app.errorMessage, 'Missing path to raw images');
                        end
                        
                    % ONLY ONE FILE
                    else
                        varFolderValue = app.pathFileAbbelight;
                        if isempty(varFolderValue) == 1
                            app.errorMessage = strcat(app.errorMessage, 'Missing path to raw images');
                        end
                    end
                    
                    % CHANNEL ROI2 PARAMETERS
                    if app.GFPChannel0CheckBox.Value==1
        
                        % PSF Emission
                        varPathPsfEmission1=[strrep(app.pathPsfEmission,'\','/'),'/'];
                        varFilePsfEmission1=app.filePsfEmission;
                        if isempty(varFilePsfEmission1) == 1 % empty path
                            app.errorMessage = strcat(app.errorMessage, ' / Missing ROI2 Emission PSF');
                        end
                        
                        % PSF excitation
                        varPathPsfExcitation1=[strrep(app.pathPsfExcitation,'\','/'),'/'];
                        varFilePsfExcitation1=app.filePsfExcitation;
                        if isempty(varFilePsfExcitation1) == 1
                            app.errorMessage = strcat(app.errorMessage, ' / Missing ROI2 Excitation PSF');
                        end
                        
                        % Numeric parameters
                        varExpFactorFieldValue1=app.expFactorField.Value;
                        varExpFactorPSFFieldValue1=app.expFactorPSFField.Value;
                        varNumItFieldValue1=app.numItField.Value;
                        varWienerParamFieldValue1=app.wienerParamField.Value;          
                        varRegularisationParameter1=app.RegularizationparameterSpinner.Value;

                        % IF ONLY ONE FILE CHECK CHANNEL    
                        if app.StreamGroup.SelectedObject == app.OnlyOneFileButton
                            if isempty(strfind(app.fileAbbelight,'ROI2')) == 0 && isempty(strfind(app.fileAbbelight,'.tif')) == 0
                                tiffFilesROI2=dir(strcat(varFolderValue,app.fileAbbelight)) ; % dir list the contents of a folder 
                            else
                                app.errorMessage = strcat(app.errorMessage, ' / Channel ROI2 (ROI2*.tif) not found in file name');
                            end
                        else
                            filepattern = fullfile(varFolderValue, 'ROI2*.tif');
                            tiffFilesROI2 = dir(filepattern);
                        end
                            
                        if isempty(tiffFilesROI2) == 1 && app.RFPChannel1CheckBox.Value == 0
                            app.errorMessage = strcat(app.errorMessage, ' / Incorrect path to access raw images.');
                        end
                    end
                    
                    % CHANNEL ROI1 PARAMETERS
                    if app.RFPChannel1CheckBox.Value==1
        
                        % PSF Emission
                        varPathPsfEmission2=[strrep(app.pathPsfEmission_2,'\','/'),'/'];
                        varFilePsfEmission2=app.filePsfEmission_2;
                        if isempty(varFilePsfEmission2) == 1
                            app.errorMessage = strcat(app.errorMessage, ' / Missing ROI1 Emission PSF');
                        end
                        
                        % PSF excitation
                        varPathPsfExcitation2=[strrep(app.pathPsfExcitation_2,'\','/'),'/'];
                        varFilePsfExcitation2=app.filePsfExcitation_2;
                        if isempty(varFilePsfExcitation2) == 1
                            app.errorMessage = strcat(app.errorMessage, ' / Missing ROI1 Excitation PSF');
                        end
                        
                        % Numeric parameters
                        varExpFactorFieldValue2=app.expFactorField_2.Value;
                        varExpFactorPSFFieldValue2=app.expFactorPSFField_2.Value;
                        varNumItFieldValue2=app.numItField_2.Value;
                        varWienerParamFieldValue2=app.wienerParamField_2.Value;      
                        varRegularisationParameter2=app.RegularizationparameterSpinner_2.Value;

                        % IF ONLY ONE FILE CHECK CHANNEL    
                        if app.StreamGroup.SelectedObject == app.OnlyOneFileButton
                            if isempty(strfind(app.fileAbbelight,'ROI1')) == 0 && isempty(strfind(app.fileAbbelight,'.tif')) == 0
                                tiffFilesROI1=dir(strcat(varFolderValue,app.fileAbbelight)) ; % dir list the contents of a folder                          
                            else
                                app.errorMessage = strcat(app.errorMessage, ' / Channel ROI1 (ROI1*.tif) not found in file name');
                            end
                        else
                            filepattern = fullfile(varFolderValue, 'ROI1*.tif');
                            tiffFilesROI1 = dir(filepattern); % list the contents of a folder
                        end
                                                
                        if isempty(tiffFilesROI1) == 1
                            app.errorMessage = strcat(app.errorMessage, ' / Incorrect path to access raw images');
                        end
                    end
                    
                    % CREATE BACKUP FOLDER
                    if app.GFPChannel0CheckBox.Value == 1 && app.RFPChannel1CheckBox.Value == 1

                       if app.StreamGroup.SelectedObject ~= app.OnlyOneFileButton
                           
                           if app.ButtonGroup.SelectedObject == app.SequentialButton
                            folderName = strcat('AlgoRIM_ROI2_it_',num2str(app.numItField.Value),'_w_',strrep(num2str(app.wienerParamField.Value),'.','p'),'_r_',strrep(num2str(varRegularisationParameter1),'.','p'),'_speckles_',num2str(app.SpeckleperimageField.Value),'_ROI1_it_',num2str(app.numItField_2.Value),'_w_',strrep(num2str(app.wienerParamField_2.Value),'.','p'),'_r_',strrep(num2str(varRegularisationParameter2),'.','p'),'_speckles_',num2str(app.SpeckleperimageField.Value),'/');
                           elseif app.ButtonGroup.SelectedObject == app.InterleavedButton
                            folderName = strcat('AlgoRIM_ROI2_it_',num2str(app.numItField.Value),'_w_',strrep(num2str(app.wienerParamField.Value),'.','p'),'_r_',strrep(num2str(varRegularisationParameter1),'.','p'),'_speckles_',num2str(app.SpeckleperimageField.Value),'_overlap_',num2str(app.OverlapField.Value),'_ROI1_it_',num2str(app.numItField_2.Value),'_w_',strrep(num2str(app.wienerParamField_2.Value),'.','p'),'_r_',strrep(num2str(varRegularisationParameter2),'.','p'),'_speckles_',num2str(app.SpeckleperimageField.Value),'_overlap_',num2str(app.OverlapField.Value),'/');
                           else
                            folderName = strcat('AlgoRIM_ROI2_it_',num2str(app.numItField.Value),'_w_',strrep(num2str(app.wienerParamField.Value),'.','p'),'_r_',strrep(num2str(varRegularisationParameter1),'.','p'),'_ROI1_it_',num2str(app.numItField_2.Value),'_w_',strrep(num2str(app.wienerParamField_2.Value),'.','p'),'_r_',strrep(num2str(varRegularisationParameter2),'.','p'),'/');
                           end

                       else
                            app.errorMessage = strcat(app.errorMessage, ' / Choose only one channel for your file');
                       end
                       
                        if app.ButtonGroup.SelectedObject == app.SequentialButton
                            varBackupFolderROI2 = strcat(varFolderValue,folderName,'Channel_ROI2_it_',num2str(app.numItField.Value),'_w_',strrep(num2str(app.wienerParamField.Value),'.','p'),'_r_',strrep(num2str(varRegularisationParameter1),'.','p'),'_speckles_',num2str(app.SpeckleperimageField.Value),'/');
                            varBackupFolderROI1 = strcat(varFolderValue,folderName,'Channel_ROI1_it_',num2str(app.numItField_2.Value),'_w_',strrep(num2str(app.wienerParamField_2.Value),'.','p'),'_r_',strrep(num2str(varRegularisationParameter2),'.','p'),'_speckles_',num2str(app.SpeckleperimageField.Value),'/'); 
                        
                        elseif app.ButtonGroup.SelectedObject == app.InterleavedButton
                            varBackupFolderROI2 = strcat(varFolderValue,folderName,'Channel_ROI2_it_',num2str(app.numItField.Value),'_w_',strrep(num2str(app.wienerParamField.Value),'.','p'),'_r_',strrep(num2str(varRegularisationParameter1),'.','p'),'_speckles_',num2str(app.SpeckleperimageField.Value),'_overlap_',num2str(app.OverlapField.Value),'/');
                            varBackupFolderROI1 = strcat(varFolderValue,folderName,'Channel_ROI1_it_',num2str(app.numItField_2.Value),'_w_',strrep(num2str(app.wienerParamField_2.Value),'.','p'),'_r_',strrep(num2str(varRegularisationParameter2),'.','p'),'_speckles_',num2str(app.SpeckleperimageField.Value),'_overlap_',num2str(app.OverlapField.Value),'/');
                        else
                            varBackupFolderROI2 = strcat(varFolderValue,folderName,'Channel_ROI2_it_',num2str(app.numItField.Value),'_w_',strrep(num2str(app.wienerParamField.Value),'.','p'),'_r_',strrep(num2str(varRegularisationParameter1),'.','p'),'/');
                            varBackupFolderROI1 = strcat(varFolderValue,folderName, 'Channel_ROI1_it_',num2str(app.numItField_2.Value),'_w_',strrep(num2str(app.wienerParamField_2.Value),'.','p'),'_r_',strrep(num2str(varRegularisationParameter2),'.','p'),'/');
                        end

                        if ~exist(strcat(varFolderValue,folderName), 'dir')
                            mkdir(varFolderValue,folderName);
                            
                            if app.ButtonGroup.SelectedObject == app.SequentialButton
                                mkdir([varFolderValue,folderName], strcat('Channel_ROI2_it_',num2str(app.numItField.Value),'_w_',strrep(num2str(app.wienerParamField.Value),'.','p'),'_r_',strrep(num2str(varRegularisationParameter1),'.','p'),'_speckles_',num2str(app.SpeckleperimageField.Value)));
                                mkdir([varFolderValue,folderName], strcat('Channel_ROI1_it_',num2str(app.numItField_2.Value),'_w_',strrep(num2str(app.wienerParamField_2.Value),'.','p'),'_r_',strrep(num2str(varRegularisationParameter2),'.','p'),'_speckles_',num2str(app.SpeckleperimageField.Value)));
                                
                            elseif app.ButtonGroup.SelectedObject == app.InterleavedButton
                                mkdir([varFolderValue,folderName], strcat('Channel_ROI2_it_',num2str(app.numItField.Value),'_w_',strrep(num2str(app.wienerParamField.Value),'.','p'),'_r_',strrep(num2str(varRegularisationParameter1),'.','p'),'_speckles_',num2str(app.SpeckleperimageField.Value),'_overlap_',num2str(app.OverlapField.Value)));
                                mkdir([varFolderValue,folderName], strcat('Channel_ROI1_it_',num2str(app.numItField_2.Value),'_w_',strrep(num2str(app.wienerParamField_2.Value),'.','p'),'_r_',strrep(num2str(varRegularisationParameter2),'.','p'),'_speckles_',num2str(app.SpeckleperimageField.Value),'_overlap_',num2str(app.OverlapField.Value)));
                            
                            else
                                mkdir([varFolderValue,folderName], strcat('Channel_ROI2_it_',num2str(app.numItField.Value),'_w_',strrep(num2str(app.wienerParamField.Value),'.','p'),'_r_',strrep(num2str(varRegularisationParameter1),'.','p')));
                                mkdir([varFolderValue,folderName], strcat('Channel_ROI1_it_',num2str(app.numItField_2.Value),'_w_',strrep(num2str(app.wienerParamField_2.Value),'.','p'),'_r_',strrep(num2str(varRegularisationParameter2),'.','p')));
                            end
                        end
                        
                    elseif app.GFPChannel0CheckBox.Value == 0 && app.RFPChannel1CheckBox.Value == 1

                        if app.ButtonGroup.SelectedObject == app.SequentialButton
                            folderName = strcat('AlgoRIM_ROI1_it_',num2str(app.numItField_2.Value),'_w_',strrep(num2str(app.wienerParamField_2.Value),'.','p'),'_r_',strrep(num2str(varRegularisationParameter2),'.','p'),'_speckles_',num2str(app.SpeckleperimageField.Value),'/');
                        elseif app.ButtonGroup.SelectedObject == app.InterleavedButton
                            folderName = strcat('AlgoRIM_ROI1_it_',num2str(app.numItField_2.Value),'_w_',strrep(num2str(app.wienerParamField_2.Value),'.','p'),'_r_',strrep(num2str(varRegularisationParameter2),'.','p'),'_speckles_',num2str(app.SpeckleperimageField.Value),'_overlap_',num2str(app.OverlapField.Value),'/');
                        else
                            folderName = strcat('AlgoRIM_ROI1_it_',num2str(app.numItField_2.Value),'_w_',strrep(num2str(app.wienerParamField_2.Value),'.','p'),'_r_',strrep(num2str(varRegularisationParameter2),'.','p'),'/');
                        end
                        if ~exist(strcat(varFolderValue,folderName), 'dir')
                            mkdir(varFolderValue,folderName);
                        end
                        varBackupFolder = strcat(varFolderValue,folderName);

                    elseif app.GFPChannel0CheckBox.Value == 1 && app.RFPChannel1CheckBox.Value == 0

                        if app.ButtonGroup.SelectedObject == app.SequentialButton
                            folderName = strcat('AlgoRIM_ROI2_it_',num2str(app.numItField.Value),'_w_',strrep(num2str(app.wienerParamField.Value),'.','p'),'_r_',strrep(num2str(varRegularisationParameter1),'.','p'),'_speckles_',num2str(app.SpeckleperimageField.Value),'/');
                        elseif app.ButtonGroup.SelectedObject == app.InterleavedButton
                            folderName = strcat('AlgoRIM_ROI2_it_',num2str(app.numItField.Value),'_w_',strrep(num2str(app.wienerParamField.Value),'.','p'),'_r_',strrep(num2str(varRegularisationParameter1),'.','p'),'_speckles_',num2str(app.SpeckleperimageField.Value),'_overlap_',num2str(app.OverlapField.Value),'/');
                        else
                            folderName = strcat('AlgoRIM_ROI2_it_',num2str(app.numItField.Value),'_w_',strrep(num2str(app.wienerParamField.Value),'.','p'),'_r_',strrep(num2str(varRegularisationParameter1),'.','p'),'/');
                        end
                        
                        if ~exist(strcat(varFolderValue,folderName), 'dir')
                            mkdir(varFolderValue,folderName);
                        end
                        varBackupFolder = strcat(varFolderValue,folderName);
                    end
                    
                    % CHANNEL ROI2 RECONSTRUCTION
                    if app.GFPChannel0CheckBox.Value == 1
                        if app.GFPChannel0CheckBox.Value==1 && app.RFPChannel1CheckBox.Value==1
                            varBackupFolder = varBackupFolderROI2;
                        end
                        reconstruction(app,tiffFilesROI2,varFolderValue,varExpFactorFieldValue1,varPathPsfEmission1,varFilePsfEmission1,varExpFactorPSFFieldValue1,varPathPsfExcitation1,varFilePsfExcitation1,varNumItFieldValue1,varWienerParamFieldValue1,varShowImages, varSpeckleperimage, varOverlapStream, varRegularisationParameter1, varBackupFolder);
                    end
                    
                    % CHANNEL ROI1 RECONSTRUCTION
                    if app.RFPChannel1CheckBox.Value == 1
                        if app.GFPChannel0CheckBox.Value==1 && app.RFPChannel1CheckBox.Value==1
                            varBackupFolder = varBackupFolderROI1;
                        end
                        reconstruction(app,tiffFilesROI1,varFolderValue,varExpFactorFieldValue2,varPathPsfEmission2,varFilePsfEmission2,varExpFactorPSFFieldValue2,varPathPsfExcitation2,varFilePsfExcitation2,varNumItFieldValue2,varWienerParamFieldValue2,varShowImages, varSpeckleperimage, varOverlapStream, varRegularisationParameter2, varBackupFolder);
                    end
                    
                    if app.GFPChannel0CheckBox.Value == 0 && app.RFPChannel1CheckBox.Value == 0
                        app.errorMessage = strcat(app.errorMessage, ' / Select at least one channel');
                    end
                    
                    if isempty(app.errorMessage) == 0
                        app.WarningArea.Value = app.errorMessage;
                    end
                    
                catch
                    if isempty(app.errorMessage) == 0
                        app.WarningArea.Value = app.errorMessage;
                    else
                        app.WarningArea.Value = 'Error. Please check paths and parameters.';
                    end
                end
                 
                
            % OTHER
            else
                
                try
                    % RAW DATA  
                    % IF work on a folder
                    if app.StreamGroup.SelectedObject ~= app.OnlyOneFileButton
                        varFolderValue = app.folderOtherField.Value;
                        if isempty(varFolderValue) == 1
                            app.errorMessage = strcat(app.errorMessage, 'Missing path to raw images');
                        end
                    % ONLY ONE FILE
                    else
                        varFolderValue = app.pathFileOther;
                        if isempty(varFolderValue) == 1
                            app.errorMessage = strcat(app.errorMessage, 'Missing path to raw images');
                        end
                    end
                                           
                    % ----- CHANNEL C0/ROI2 PARAMETERS
                    
                    % PSF Emission
                    varPathPsfEmission1=[strrep(app.pathPsfEmission,'\','/'),'/'];
                    varFilePsfEmission1=app.filePsfEmission;
                    if isempty(varFilePsfEmission1) == 1 % empty path
                        app.errorMessage = strcat(app.errorMessage, ' / Missing Emission PSF');
                    end
                    
                    % PSF excitation
                    varPathPsfExcitation1=[strrep(app.pathPsfExcitation,'\','/'),'/'];
                    varFilePsfExcitation1=app.filePsfExcitation;
                    if isempty(varFilePsfExcitation1) == 1
                        app.errorMessage = strcat(app.errorMessage, ' / Missing Excitation PSF');
                    end
                    
                    % Numeric parameters
                    varExpFactorFieldValue1=app.expFactorField.Value;
                    varExpFactorPSFFieldValue1=app.expFactorPSFField.Value;
                    varNumItFieldValue1=app.numItField.Value;
                    varWienerParamFieldValue1=app.wienerParamField.Value;          
                    varRegularisationParameter1=app.RegularizationparameterSpinner.Value;
                    

                    if app.StreamGroup.SelectedObject == app.OnlyOneFileButton
                        tiffFiles = dir(app.fileOtherField.Value);

                    else
                        filepattern = fullfile(varFolderValue, '*.tif');
                        tiffFiles = dir(filepattern); % list the contents of a folder
                    end
                                        
                    if isempty(tiffFiles) == 1
                        app.errorMessage = strcat(app.errorMessage, ' / Incorrect path to access raw images.');
                    end

                    % CREATE BACKUP FOLDER                    
                    if app.ButtonGroup.SelectedObject == app.SequentialButton
                        folderName = strcat('AlgoRIM_it_',num2str(app.numItField.Value),'_w_',strrep(num2str(app.wienerParamField.Value),'.','p'),'_r_',strrep(num2str(varRegularisationParameter1),'.','p'),'_speckles_',num2str(app.SpeckleperimageField.Value),'/');

                    elseif app.ButtonGroup.SelectedObject == app.InterleavedButton
                        folderName = strcat('AlgoRIM_it_',num2str(app.numItField.Value),'_w_',strrep(num2str(app.wienerParamField.Value),'.','p'),'_r_',strrep(num2str(varRegularisationParameter1),'.','p'),'_speckles_',num2str(app.SpeckleperimageField.Value),'_overlap_',num2str(app.OverlapField.Value),'/');
                    else
                        folderName = strcat('AlgoRIM_it_',num2str(app.numItField.Value),'_w_',strrep(num2str(app.wienerParamField.Value),'.','p'),'_r_',strrep(num2str(varRegularisationParameter1),'.','p'),'/');
                    end
                    
                    if ~exist(strcat(varFolderValue,folderName), 'dir')
                        mkdir(varFolderValue,folderName);
                    end
                    varBackupFolder = strcat(varFolderValue,folderName);
                    
                    
                    % ----- CHANNEL C0/ROI2 RECONSTRUCTION
                    reconstruction(app,tiffFiles,varFolderValue,varExpFactorFieldValue1,varPathPsfEmission1,varFilePsfEmission1,varExpFactorPSFFieldValue1,varPathPsfExcitation1,varFilePsfExcitation1,varNumItFieldValue1,varWienerParamFieldValue1,varShowImages, varSpeckleperimage, varOverlapStream, varRegularisationParameter1, varBackupFolder);
                                        
                    if isempty(app.errorMessage) == 0
                        app.WarningArea.Value = app.errorMessage;
                    end
                    
                catch
                    if isempty(app.errorMessage) == 0
                        app.WarningArea.Value = app.errorMessage;
                    else
                        app.WarningArea.Value = 'Error. Please check paths and parameters.';
                    end
                end
            end
            
            tEnd=toc(tStart);
            s = seconds(tEnd);
            s.Format = 'hh:mm:ss';
            
            app.Lamp.Enable='off';
            app.Lamp.Color='green';
            app.BusyLabel.Visible='off';
            
            app.timeLabel.Text=strcat('Time : ',string(s));
            app.timeLabel.Visible='on';
            app.LaunchButton.Enable = 'on';

        end

        % Button pushed function: SelectCurFolderButton
        function SelectCurFolderButtonPushed(app, event)
          app.SelectCurFolderButton.Enable = 'off';
            app.pathCurFolder = [strrep(uigetdir(app.curFolderField.Value),'\','/'),'/'];
            if app.pathCurFolder~=0 % if the selection is not canceled
                try
                    app.curFolderField.Value = app.pathCurFolder;
                catch
                end
            end
          app.SelectCurFolderButton.Enable = 'on';

        end

        % Button pushed function: SelectPsfEmissionButton
        function SelectPsfEmissionButtonPushed(app, event)
            app.SelectPsfEmissionButton.Enable = 'off';
        
            if isempty(app.varPathPsfEmission) % file backup.mat doesnt exist yet
                [app.filePsfEmission,app.pathPsfEmission] = uigetfile('*.*');
            else
                [app.filePsfEmission,app.pathPsfEmission] = uigetfile(strcat(app.varPathPsfEmission.Value,'*.*'));
            end
            
            if app.pathPsfEmission == 0 % if selection is  canceled
                if isempty(app.varPathPsfEmission) == 0 % if a path already exist, use it
                    app.filePsfEmission = app.varFilePsfEmission.Value;
                    app.pathPsfEmission = app.varPathPsfEmission.Value;
                else
                    app.filePsfEmission = '';
                    app.pathPsfEmission = '';
                end
            else
                 try
                    app.varPathPsfEmission.Value = [strrep(app.pathPsfEmission,'\','/')];
                    app.varFilePsfEmission.Value = app.filePsfEmission;
                    app.psfEmissionField.Value = [strrep(app.pathPsfEmission,'\','/'),app.filePsfEmission];
                catch
                end
            end
            app.SelectPsfEmissionButton.Enable = 'on';

        end

        % Button pushed function: SelectPsfExcitationButton
        function SelectPsfExcitationButtonPushed(app, event)
            app.SelectPsfExcitationButton.Enable = 'off';

            if isempty(app.varPathPsfExcitation) % file backup.mat doesnt exist yet
                [app.filePsfExcitation,app.pathPsfExcitation] = uigetfile('*.*');
            else
                [app.filePsfExcitation,app.pathPsfExcitation] = uigetfile(strcat(app.varPathPsfExcitation.Value,'*.*'));
            end
                       
            if app.pathPsfExcitation == 0 % if selection is  canceled
                if isempty(app.varPathPsfExcitation) == 0 % if a path already exist, use it
                    app.filePsfExcitation = app.varFilePsfExcitation.Value;
                    app.pathPsfExcitation = app.varPathPsfExcitation.Value;
                else
                    app.filePsfExcitation = '';
                    app.pathPsfExcitation = '';
                end
            else
                 try
                    app.varPathPsfExcitation.Value = [strrep(app.pathPsfExcitation,'\','/')];
                    app.varFilePsfExcitation.Value = app.filePsfExcitation;
                    app.psfExcitationField.Value = [strrep(app.pathPsfExcitation,'\','/'), app.filePsfExcitation];
                catch
                end
            end
            app.SelectPsfExcitationButton.Enable = 'on';

        end

        % Button pushed function: LaunchpreviewGFPButton
        function LaunchpreviewGFPButtonPushed(app, event)
            if app.GFPChannel0CheckBox.Value == 1  && app.OtherButton.Value == 0
                
               close all;
               clc;
               
               % Preview on
               varshowImages = 1;

               % User experience
                app.Lamp.Enable='on';  
                app.Lamp.Color='red';
                app.BusyLabel.Visible='on';
                app.timeLabel.Visible='off';
                app.LaunchpreviewGFPButton.Enable = 'off';
                app.WarningArea.Value = '';
                app.errorMessage = '';
                drawnow();
                tStartPrev = tic;
                
                 try
                    % INSCOPER
                    if app.AcquisitionsoftwareButtonGroup.SelectedObject == app.InscoperButton
                        
                        % GLOBAL FOLDER
                        if app.StreamGroup.SelectedObject == app.GlobalfolderButton
                            varFolderValue = app.curFolderField.Value;
                            if isempty(varFolderValue) == 1
                                app.errorMessage = strcat(app.errorMessage, 'Missing path to raw images');
                            end
                            filepattern=fullfile(varFolderValue, '*c0*.tif');
                            tiffFiles=dir(filepattern); % dir list the contents of a folder
                            
                        % RAW DATA FOLDER
                        elseif app.StreamGroup.SelectedObject == app.MultipleImagesButton
                            varFolderValue = app.GlobalFolderField.Value;
                            if isempty(varFolderValue) == 1
                                app.errorMessage = strcat(app.errorMessage, 'Missing path to raw images');
                            end
                            filepattern=fullfile(varFolderValue, '*c0*.tif');
                            tiffFiles=dir(filepattern); % dir list the contents of a folder
                        % ONLY ONE FILE
                        else
                            varFolderValue = app.pathFileInscoper;
                            if isempty(varFolderValue) == 1
                                app.errorMessage = strcat(app.errorMessage, 'Missing path to raw images');
                            end
                            if isempty(strfind(app.fileInscoper,'c0')) == 0 && isempty(strfind(app.fileInscoper,'.tif')) == 0
                                tiffFiles=dir(strcat(varFolderValue,app.fileInscoper)) ; % dir list the contents of a folder                          
                            else
                                app.errorMessage = strcat(app.errorMessage, ' / Channel 0 (*c0*.tif) not found in file name');
                            end
                        end

                        if isempty(tiffFiles) == 1 && isempty(varFolderValue) == 0
                            app.errorMessage = strcat(app.errorMessage, ' / Incorrect path to access raw images');
                        end
                        
                    % ABBELIGHT    
                    elseif app.AcquisitionsoftwareButtonGroup.SelectedObject == app.AbbelightButton

                        % RAW DATA FOLDER
                         % IF work on a folder
                        if app.StreamGroup.SelectedObject ~= app.OnlyOneFileButton
                            varFolderValue = app.FolderAbbelightField.Value;
                            if isempty(varFolderValue) == 1
                                app.errorMessage = strcat(app.errorMessage, 'Missing path to raw images');
                            end
                            filepattern = fullfile(varFolderValue, 'ROI2*.tif');
                            tiffFiles = dir(filepattern);
                            
                        % ONLY ONE FILE    
                        else
                            varFolderValue = app.pathFileAbbelight;
                            if isempty(varFolderValue) == 1
                                app.errorMessage = strcat(app.errorMessage, 'Missing path to raw images');
                            end
                            if isempty(strfind(app.fileAbbelight,'ROI2')) == 0 && isempty(strfind(app.fileAbbelight,'.tif')) == 0
                                tiffFiles=dir(strcat(varFolderValue,app.fileAbbelight)) ; % dir list the contents of a folder                          
                            else
                                app.errorMessage = strcat(app.errorMessage, ' / Channel ROI2 (ROI2*.tif) not found in file name');
                            end
                        end

                        if isempty(tiffFiles) == 1 && isempty(varFolderValue) == 0
                            app.errorMessage = strcat(app.errorMessage, ' / Incorrect path to access raw images');
                        end
                    end
 
                    reconstruction(app,tiffFiles,varFolderValue,app.expFactorField.Value,app.pathPsfEmission,app.filePsfEmission,app.expFactorPSFField.Value,app.pathPsfExcitation,app.filePsfExcitation,app.numItField.Value,app.wienerParamField.Value,varshowImages, app.SpeckleperimageField.Value, app.OverlapField.Value, app.RegularizationparameterSpinner.Value, '');

                 catch
                    if isempty(app.errorMessage) == 0
                        app.WarningArea.Value = app.errorMessage;
                    else
                        app.WarningArea.Value = 'Missing parameters';
                    end
                 end
                
                temps = toc(tStartPrev);
                s = seconds(temps);
                s.Format = 'hh:mm:ss';
                
                app.Lamp.Enable='off';
                app.Lamp.Color='green';
                app.BusyLabel.Visible='off';
                
                app.timeLabel.Text=strcat('Time : ',string(s));
                app.timeLabel.Visible='on';
                app.LaunchpreviewGFPButton.Enable = 'on';

            else
                app.WarningArea.Value ='Checkbox unchecked';
            end

            if app.OtherButton.Value == 1
               close all;
               clc;
               
               % Preview on
               varshowImages = 1;

               % User experience
                app.Lamp.Enable='on';  
                app.Lamp.Color='red';
                app.BusyLabel.Visible='on';
                app.timeLabel.Visible='off';
                app.LaunchpreviewGFPButton.Enable = 'off';
                app.WarningArea.Value = '';
                app.errorMessage = '';
                drawnow();
                tStartPrev = tic;
                
                 try

                    % Current folder
                    % IF work on a folder
                   if app.StreamGroup.SelectedObject ~= app.OnlyOneFileButton
                        varFolderValue = app.folderOtherField.Value;
                        if isempty(varFolderValue) == 1
                            app.errorMessage = strcat(app.errorMessage, 'Missing path to raw images');
                        end
                    else
                        varFolderValue = app.pathFileOther;
                        if isempty(varFolderValue) == 1
                            app.errorMessage = strcat(app.errorMessage, 'Missing path to raw images');
                        end
                    end
                    filepattern = fullfile(varFolderValue, '*.tif');
                    tiffFiles = dir(filepattern);
                    if isempty(tiffFiles) == 1 && isempty(varFolderValue) == 0
                        app.errorMessage = strcat(app.errorMessage, ' / Incorrect path to access raw images');
                    end
 
                    reconstruction(app,tiffFiles,varFolderValue,app.expFactorField.Value,app.pathPsfEmission,app.filePsfEmission,app.expFactorPSFField.Value,app.pathPsfExcitation,app.filePsfExcitation,app.numItField.Value,app.wienerParamField.Value,varshowImages, app.SpeckleperimageField.Value, app.OverlapField.Value, app.RegularizationparameterSpinner.Value, '');

                 catch
                    if isempty(app.errorMessage) == 0
                        app.WarningArea.Value = app.errorMessage;
                    else
                        app.WarningArea.Value = 'Missing parameters';
                    end
                 end
                
                temps = toc(tStartPrev);
                s = seconds(temps);
                s.Format = 'hh:mm:ss';
                
                app.Lamp.Enable='off';
                app.Lamp.Color='green';
                app.BusyLabel.Visible='off';
                
                app.timeLabel.Text=strcat('Time : ',string(s));
                app.timeLabel.Visible='on';
                app.LaunchpreviewGFPButton.Enable = 'on';
            end
        end

        % Value changed function: GFPChannel0CheckBox
        function GFPChannel0CheckBoxValueChanged(app, event)
            value = app.GFPChannel0CheckBox.Value;
            
            if value == 0
                displayGFPPannel(app, 'off'); % Hide
            else
                % IF work on a FILE : one file can only have one channel
                if app.StreamGroup.SelectedObject == app.OnlyOneFileButton

                    displayRFPPannel(app, 'off');
                    app.RFPChannel1CheckBox.Value = 0;
                end
                
                displayGFPPannel(app, 'on'); % Show
            end
        end

        % Value changed function: RFPChannel1CheckBox
        function RFPChannel1CheckBoxValueChanged(app, event)
            value = app.RFPChannel1CheckBox.Value;
            
            if value == 0
                displayRFPPannel(app, 'off');
            else
                % IF work on a FILE : one file can only have one channel
                if app.StreamGroup.SelectedObject == app.OnlyOneFileButton
                    
                    displayGFPPannel(app, 'off');
                    app.GFPChannel0CheckBox.Value = 0;
                end
                
                displayRFPPannel(app, 'on');
            end
        end

        % Button pushed function: LaunchpreviewRFPButton
        function LaunchpreviewRFPButtonPushed(app, event)
            if app.RFPChannel1CheckBox.Value == 1  && app.OtherButton.Value == 0
                close all;
                clc;         
                
                % Preview on
                varshowImages = 1;

                % User experience
                app.Lamp.Enable='on';
                app.Lamp.Color='red';
                app.BusyLabel.Visible='on';
                app.timeLabel.Visible='off';
                app.LaunchpreviewRFPButton.Enable = 'off';
                app.WarningArea.Value = '';
                app.errorMessage = '';
                drawnow();
                tStartPrev = tic;
                
                try
                    % INSCOPER
                    if app.AcquisitionsoftwareButtonGroup.SelectedObject == app.InscoperButton
                        
                        % GLOBAL FOLDER
                        if app.StreamGroup.SelectedObject == app.GlobalfolderButton
                            varFolderValue = app.curFolderField.Value;
                            if isempty(varFolderValue) == 1
                                app.errorMessage = strcat(app.errorMessage, 'Missing path to raw images');
                            end
                            filepattern=fullfile(varFolderValue, '*c1*.tif');
                            tiffFiles=dir(filepattern); % dir list the contents of a folder
                            
                        % RAW DATA FOLDER    
                        elseif app.StreamGroup.SelectedObject == app.MultipleImagesButton
                            varFolderValue = app.GlobalFolderField.Value;
                            if isempty(varFolderValue) == 1
                                app.errorMessage = strcat(app.errorMessage, 'Missing path to raw images');
                            end
                            filepattern=fullfile(varFolderValue, '*c1*.tif');
                            tiffFiles=dir(filepattern); % dir list the contents of a folder
                            
                        % ONLY ONE FILE    
                        else
                            varFolderValue = app.pathFileInscoper;
                            if isempty(varFolderValue) == 1
                                app.errorMessage = strcat(app.errorMessage, 'Missing path to raw images');
                            end
                            if isempty(strfind(app.fileInscoper,'c1')) == 0 && isempty(strfind(app.fileInscoper,'.tif')) == 0
                                tiffFiles=dir(strcat(varFolderValue,app.fileInscoper)) ; % dir list the contents of a folder                          
                            else
                                app.errorMessage = strcat(app.errorMessage, ' / Channel 1 (*c1*.tif) not found in file name');
                            end
                        end

                        if isempty(tiffFiles) == 1 && isempty(varFolderValue) == 0
                            app.errorMessage = strcat(app.errorMessage, ' / Incorrect path to access raw images');
                        end
                        
                    % ABBELIGHT    
                    elseif app.AcquisitionsoftwareButtonGroup.SelectedObject == app.AbbelightButton
                        
                        % RAW DATA FOLDER    
                       % IF work on a folder
                        if app.StreamGroup.SelectedObject ~= app.OnlyOneFileButton
                            varFolderValue = app.FolderAbbelightField.Value;
                            if isempty(varFolderValue) == 1
                                app.errorMessage = strcat(app.errorMessage, 'Missing path to raw images');
                            end
                            filepattern = fullfile(varFolderValue, 'ROI1*.tif');
                            tiffFiles = dir(filepattern);
                            
                        % ONLY ONE FILE
                        else
                            varFolderValue = app.pathFileAbbelight;
                            if isempty(varFolderValue) == 1
                                app.errorMessage = strcat(app.errorMessage, 'Missing path to raw images');
                            end
                            if isempty(strfind(app.fileAbbelight,'ROI1')) == 0 && isempty(strfind(app.fileAbbelight,'.tif')) == 0
                                tiffFiles=dir(strcat(varFolderValue,app.fileAbbelight)) ; % dir list the contents of a folder                          
                            else
                                app.errorMessage = strcat(app.errorMessage, ' / Channel ROI1 (ROI1*.tif) not found in file name');
                            end
                        end

                        if isempty(tiffFiles) == 1 && isempty(varFolderValue) == 0
                            app.errorMessage = strcat(app.errorMessage, ' / Incorrect path to access raw images');
                        end
                    end

                    reconstruction(app,tiffFiles,varFolderValue,app.expFactorField_2.Value,app.pathPsfEmission_2,app.filePsfEmission_2,app.expFactorPSFField_2.Value,app.pathPsfExcitation_2,app.filePsfExcitation_2,app.numItField_2.Value,app.wienerParamField_2.Value, varshowImages, app.SpeckleperimageField.Value, app.OverlapField.Value, app.RegularizationparameterSpinner_2.Value, '');
                  
                catch
                    if isempty(app.errorMessage) == 0
                        app.WarningArea.Value = app.errorMessage;
                    else
                        app.WarningArea.Value = 'Missing parameters';
                    end
                end
                
                temps = toc(tStartPrev);
                s = seconds(temps);
                s.Format = 'hh:mm:ss';
                
                app.Lamp.Enable='off';
                app.Lamp.Color='green';
                app.BusyLabel.Visible='off';
                
                app.timeLabel.Text=strcat('Time : ',string(s));
                app.timeLabel.Visible='on';
                app.LaunchpreviewRFPButton.Enable = 'on';

            else
                app.WarningArea.Value = 'Checkbox unchecked';
            end
        end

        % Button pushed function: SelectPsfEmissionButton_2
        function SelectPsfEmissionButton_2Pushed(app, event)
            app.SelectPsfEmissionButton_2.Enable = 'off';
        
            if isempty(app.varPathPsfEmission_2) % file backup.mat doesnt exist yet
                [app.filePsfEmission_2,app.pathPsfEmission_2] = uigetfile('*.*');
            
            else
                [app.filePsfEmission_2,app.pathPsfEmission_2] = uigetfile(strcat(app.varPathPsfEmission_2.Value,'*.*'));
                
            end
            
            if app.pathPsfEmission_2 == 0 % if selection is  canceled
                if isempty(app.varPathPsfEmission_2) == 0 % if a path already exist, use it
                    app.filePsfEmission_2 = app.varFilePsfEmission_2.Value;
                    app.pathPsfEmission_2 = app.varPathPsfEmission_2.Value;
                else
                    app.filePsfEmission_2 = '';
                    app.pathPsfEmission_2 = '';
                end
                
            else
                 try
                    app.varPathPsfEmission_2.Value = [strrep(app.pathPsfEmission_2,'\','/')];
                    app.varFilePsfEmission_2.Value = app.filePsfEmission_2;
                    app.psfEmissionField_2.Value = [strrep(app.pathPsfEmission_2,'\','/'),app.filePsfEmission_2];
                catch
                end
            end
            app.SelectPsfEmissionButton_2.Enable = 'on';
            
        end

        % Button pushed function: SelectPsfExcitationButton_2
        function SelectPsfExcitationButton_2Pushed(app, event)
            app.SelectPsfExcitationButton_2.Enable = 'off';
            
            if isempty(app.varPathPsfExcitation_2) % file backup.mat doesnt exist yet
                [app.filePsfExcitation_2,app.pathPsfExcitation_2] = uigetfile('*.*');
            else
                [app.filePsfExcitation_2,app.pathPsfExcitation_2] = uigetfile(strcat(app.varPathPsfExcitation_2.Value,'*.*'));
            end
                       
            if app.pathPsfExcitation_2 == 0 % if selection is  canceled
                if isempty(app.varPathPsfExcitation_2) == 0 % if a path already exist, use it
                    app.filePsfExcitation_2 = app.varFilePsfExcitation_2.Value;
                    app.pathPsfExcitation_2 = app.varPathPsfExcitation_2.Value;
                else
                    app.filePsfExcitation_2 = '';
                    app.pathPsfExcitation_2 = '';
                end
                
            else
                 try
                    app.varPathPsfExcitation_2.Value = [strrep(app.pathPsfExcitation_2,'\','/')];
                    app.varFilePsfExcitation_2.Value = app.filePsfExcitation_2;
                    app.psfExcitationField_2.Value = [strrep(app.pathPsfExcitation_2,'\','/'), app.filePsfExcitation_2];
                catch
                end
            end
            app.SelectPsfExcitationButton_2.Enable = 'on';

        end

        % Close request function: UIFigure
        function UIFigureCloseRequest(app, event)
            
            state.curFolderField.Value = app.curFolderField.Value;
            state.GlobalFolderField.Value = app.GlobalFolderField.Value;
            
            state.FolderAbbelightField.Value = app.FolderAbbelightField.Value;
            state.folderOtherField.Value = app.folderOtherField.Value;

            state.CutofffrequencySpinner.Value = app.CutofffrequencySpinner.Value;
            
            % Inscoper File
            if isempty(app.varPathFileInscoper)==0
                state.varPathFileInscoper.Value = app.varPathFileInscoper.Value;
                state.varFileFileInscoper.Value = app.varFileFileInscoper.Value;
            end
            state.FileInscoperField.Value = app.FileInscoperField.Value;

             % Abbelight File
            if isempty(app.varPathFileAbbelight)==0
                state.varPathFileAbbelight.Value = app.varPathFileAbbelight.Value;
                state.varFileAbbelight.Value = app.varFileAbbelight.Value;
            end
            state.FileAbbelightField.Value = app.FileAbbelightField.Value;

            
            % PSF Emission File
            if isempty(app.varPathPsfEmission)==0
                state.varPathPsfEmission.Value = app.varPathPsfEmission.Value;
                state.varFilePsfEmission.Value = app.varFilePsfEmission.Value;
            end
            state.psfEmissionField.Value = app.psfEmissionField.Value;

            % Other file
            if isempty(app.varPathFileOther)==0
                state.varPathFileOther.Value = app.varPathFileOther.Value;
                state.varFileFileOther.Value = app.varFileFileOther.Value;
            end
            state.fileOtherField.Value = app.fileOtherField.Value;
                            
            % PSF Excitation File
            if isempty(app.varPathPsfExcitation)==0
                state.varPathPsfExcitation.Value = app.varPathPsfExcitation.Value;
                state.varFilePsfExcitation.Value = app.varFilePsfExcitation.Value;
            end
            state.psfExcitationField.Value = app.psfExcitationField.Value;

            if isempty(app.varPathPsfEmission_2)==0
                state.varPathPsfEmission_2.Value = app.varPathPsfEmission_2.Value;
                state.varFilePsfEmission_2.Value = app.varFilePsfEmission_2.Value;
            end
            state.psfEmissionField_2.Value = app.psfEmissionField_2.Value;

            if isempty(app.varPathPsfExcitation_2)==0
                state.varPathPsfExcitation_2.Value = app.varPathPsfExcitation_2.Value;
                state.varFilePsfExcitation_2.Value = app.varFilePsfExcitation_2.Value;
            end
            state.psfExcitationField_2.Value = app.psfExcitationField_2.Value;

            save('backup.mat','state');
            
            delete(app)
        end

        % Button pushed function: SelectGlobalFolderButton
        function SelectGlobalFolderButtonValueChanged(app, event)
            app.SelectGlobalFolderButton.Enable = 'off';
           
            app.pathGlobalFolder = [strrep(uigetdir(app.GlobalFolderField.Value),'\','/'),'/'];
            
            if app.pathGlobalFolder ~= 0 % if the selection is not canceled
                try
                    app.GlobalFolderField.Value = app.pathGlobalFolder;
                catch
                end
            end
            app.SelectGlobalFolderButton.Enable = 'on';

        end

        % Selection changed function: AcquisitionsoftwareButtonGroup
        function AcquisitionsoftwareButtonGroupSelectionChanged(app, event)
            selectedButton = app.AcquisitionsoftwareButtonGroup.SelectedObject;
            
            if selectedButton == app.InscoperButton % INSCOPER
                
                % Channel RFP
                app.Panel_2.Visible = 'on';
                app.GFPChannel0CheckBox.Visible ='on';
                app.OnechannelLabel.Visible ='off';
                
                % Display global folder radio button
                app.GlobalfolderButton.Visible = 'on';
                app.HelpGlobalFolderButton.Visible = 'on';
                
                displayFolderAbbelight(app, 'off');
                displayFileAbbelight(app, 'off');
                displayFolderOther(app, 'off');
                displayFileOther(app, 'off');
                
                % GFP panel content
                if app.GFPChannel0CheckBox.Value == 0
                    displayGFPPannel(app, 'off');
                end
                
                if app.StreamGroup.SelectedObject == app.OnlyOneFileButton

                    displayFolderInscoper(app, 'off');
                    
                    % Global folder Inscoper
                    app.GlobalfolderLabel.Visible = 'off';

                    % Raw data folder Inscoper
                    app.RawimagefolderLabel_3.Visible = 'off';

                    displayPreviewInscoper(app, 'off');
                    displayFileInscoper(app, 'on');
                    
                elseif app.StreamGroup.SelectedObject == app.MultipleImagesButton

                    displayFolderInscoper(app, 'on');

                    % Global folder Inscoper
                    app.GlobalfolderLabel.Visible = 'off';
                    
                    % Raw data folder Inscoper
                    app.RawimagefolderLabel_3.Visible = 'on';

                    displayPreviewInscoper(app, 'off');
                    displayFileInscoper(app, 'off');
                    
                else % If "Global folder Inscoper" display preview
                    
                    displayFolderInscoper(app, 'on');
                    
                    % Global folder Inscoper
                    app.GlobalfolderLabel.Visible = 'on';
                    
                    % Raw data folder Inscoper
                    app.RawimagefolderLabel_3.Visible = 'off';

                    displayPreviewInscoper(app, 'on');
                    displayFileInscoper(app, 'off');
                end

            elseif selectedButton == app.AbbelightButton % ABBELIGHT
                % Channel RFP
                app.Panel_2.Visible = 'on';
                app.GFPChannel0CheckBox.Visible ='on';
                app.OnechannelLabel.Visible ='off';
                
                % Display global folder radio button
                app.HelpGlobalFolderButton.Visible = 'off';
                app.GlobalfolderButton.Visible = 'off';
                                
                displayFolderInscoper(app, 'off');
                
                % Global folder Inscoper
                app.GlobalfolderLabel.Visible = 'off';
                
                % Raw data folder Inscoper
                app.RawimagefolderLabel_3.Visible = 'off';
                
                displayPreviewInscoper(app, 'off');
                displayFileInscoper(app, 'off');
                displayFolderOther(app, 'off');
                displayFileOther(app, 'off');
                
                % GFP panel content
                if app.GFPChannel0CheckBox.Value == 0
                    displayGFPPannel(app, 'off');
                end
                
                if app.StreamGroup.SelectedObject == app.OnlyOneFileButton
                    
                    displayFolderAbbelight(app, 'off');
                    displayFileAbbelight(app, 'on');
                    
                elseif app.StreamGroup.SelectedObject == app.MultipleImagesButton

                    displayFolderAbbelight(app, 'on');
                    displayFileAbbelight(app, 'off');

                else
                    app.StreamGroup.SelectedObject = app.MultipleImagesButton;
                    displayFolderAbbelight(app, 'on');
                end
                
            else % OTHER
                
                % Hide channel RFP : only one channel
                app.Panel_2.Visible = 'off';
                app.GFPChannel0CheckBox.Visible ='off';
                app.OnechannelLabel.Visible ='on';
                
                % Display global folder radio button
                app.HelpGlobalFolderButton.Visible = 'off';
                app.GlobalfolderButton.Visible = 'off';
                
                displayFolderInscoper(app, 'off');
                
                % Global folder Inscoper
                app.GlobalfolderLabel.Visible = 'off';
                
                % Raw data folder Inscoper
                app.RawimagefolderLabel_3.Visible = 'off';
                
                displayPreviewInscoper(app, 'off');
                displayFileInscoper(app, 'off');
                displayFolderAbbelight(app, 'off');
                displayFileAbbelight(app, 'off');
                displayGFPPannel(app, 'on');
                
                if app.StreamGroup.SelectedObject == app.OnlyOneFileButton

                    displayFolderOther(app, 'off');
                    displayFileOther(app, 'on');
                    
                elseif app.StreamGroup.SelectedObject == app.MultipleImagesButton
                    
                    displayFolderOther(app, 'on');
                    displayFileOther(app, 'off');
                else
                    app.StreamGroup.SelectedObject = app.MultipleImagesButton;
                    
                    displayFolderOther(app, 'on');
                end
            end
        end

        % Button pushed function: SelectFolderAbbelightButton
        function SelectFolderAbbelightButtonPushed(app, event)
          app.SelectFolderAbbelightButton.Enable = 'off';
  
            app.pathFolderAbbelight = [strrep(uigetdir(app.FolderAbbelightField.Value),'\','/'),'/'];
            if app.pathFolderAbbelight ~= 0 % if the selection is not canceled
                try
                    app.FolderAbbelightField.Value = app.pathFolderAbbelight;
                catch
                end
            end
          app.SelectFolderAbbelightButton.Enable = 'on';

        end

        % Selection changed function: StreamGroup
        function StreamGroupSelectionChanged(app, event)
            selectedButton = app.StreamGroup.SelectedObject;
            
% Different input (ex : one Inscoper and one for Abbelight) is needed in order to backup last path.
% globalFolder : Inscoper folder
% curFolder : Inscoper, preview (multiple folders => preview apart)
% FileInscoperField : Inscoper file
% FolderAbbelightField : Abbelight folder
% FileAbbelightField : Abbelight file

            if selectedButton == app.OnlyOneFileButton
                app.ButtonGroup.Visible = 'on';
                
                % Full file, Sequential, Interleaved ---
                app.FullFileButton.Value = 1;
                
                app.SequentialButton.Visible = 'on';
                app.InterleavedButton.Visible = 'on';
                
                app.SequentialButton.Value = 0;
                displaySequential(app, 'off');
                
                displayInterleaved(app, 'off');
                % --- Full file, Sequential, Interleaved.
                
                displayFolderAbbelight(app, 'off');     
                displayFolderInscoper(app, 'off');

                % Global folder Inscoper
                app.GlobalfolderLabel.Visible = 'off';
                
                % Raw data folder Inscoper
                app.RawimagefolderLabel_3.Visible = 'off';
                
                
                displayPreviewInscoper(app, 'off');
                displayFolderOther(app, 'off');
                
                if app.GFPChannel0CheckBox.Value == 1 && app.RFPChannel1CheckBox.Value == 1
                    
                    app.RFPChannel1CheckBox.Value = 0;
                    displayRFPPannel(app, 'off');
                end
                
                if app.AcquisitionsoftwareButtonGroup.SelectedObject == app.InscoperButton
                    
                    displayFileInscoper(app, 'on');
                    app.HelpGlobalFolderButton.Visible = 'on';

                elseif app.AcquisitionsoftwareButtonGroup.SelectedObject == app.AbbelightButton
                    
                    displayFileAbbelight(app, 'on');
                    app.HelpGlobalFolderButton.Visible = 'off';
                    
                else
                    displayFileOther(app, 'on');
                    app.HelpGlobalFolderButton.Visible = 'off';
                end
                    
             elseif selectedButton == app.MultipleImagesButton

                app.ButtonGroup.Visible = 'on';
                
                % Full file, Sequential, Interleaved ---
                app.FullFileButton.Value = 1;
                
                app.SequentialButton.Visible = 'on';
                app.InterleavedButton.Visible = 'on';
                
                app.SequentialButton.Value = 0;
                displaySequential(app, 'off');
                
                displayInterleaved(app, 'off');
                % --- Full file, Sequential, Interleaved.
                
                displayPreviewInscoper(app, 'off');
                displayFileInscoper(app, 'off');
                displayFileAbbelight(app, 'off');
                displayFileOther(app, 'off');
                
                if app.AcquisitionsoftwareButtonGroup.SelectedObject == app.InscoperButton
                    
                    displayFolderInscoper(app, 'on');

                    % Global folder Inscoper
                    app.GlobalfolderLabel.Visible = 'off';
                    
                    % Raw data folder Inscoper
                    app.RawimagefolderLabel_3.Visible = 'on';
                    
                    app.HelpGlobalFolderButton.Visible = 'on';

                elseif app.AcquisitionsoftwareButtonGroup.SelectedObject == app.AbbelightButton
                    displayFolderAbbelight(app, 'on');
                    app.HelpGlobalFolderButton.Visible = 'off';
                    
                else
                    displayFolderOther(app, 'on');
                    app.HelpGlobalFolderButton.Visible = 'off';
                end
                
            else % Global folder
                app.ButtonGroup.Visible = 'on';
                
                % Full file, Sequential, Interleaved ---
                app.FullFileButton.Value = 1;                 
                app.SequentialButton.Value = 0;
                displaySequential(app, 'off');
                displayInterleaved(app, 'off');

                app.SequentialButton.Visible = 'off';
                app.InterleavedButton.Visible = 'off';

                % --- Full file, Sequential, Interleaved.
                
                app.HelpGlobalFolderButton.Visible = 'on';
                
                displayFolderInscoper(app, 'on');
                
                % Global folder Inscoper
                app.GlobalfolderLabel.Visible = 'on';
                
                % Raw data folder Inscoper
                app.RawimagefolderLabel_3.Visible = 'off';

                displayPreviewInscoper(app, 'on');
                displayFileInscoper(app, 'off');
                displayFileAbbelight(app, 'off');
                displayFolderAbbelight(app, 'off');
                displayFolderOther(app, 'off');
                displayFileOther(app, 'off');
            end
            
        end

        % Selection changed function: ButtonGroup
        function ButtonGroupSelectionChanged(app, event)
            selectedButton = app.ButtonGroup.SelectedObject;
            
            if selectedButton == app.SequentialButton
                
                displayInterleaved(app, 'off');
                displaySequential(app, 'on');
                
            elseif selectedButton == app.InterleavedButton  
                displayInterleaved(app, 'on');
                displaySequential(app, 'on');

            else 
                displayInterleaved(app, 'off');
                displaySequential(app, 'off');
            end

        end

        % Button pushed function: SelectFileAbbelightButton
        function SelectFileAbbelightButtonPushed(app, event)
          app.SelectFileAbbelightButton.Enable = 'off';

            if isempty(app.varPathFileAbbelight) % file backup.mat doesnt exist yet
                [app.fileAbbelight,app.pathFileAbbelight] = uigetfile('*.*');
            else
                [app.fileAbbelight,app.pathFileAbbelight] = uigetfile(strcat(app.varPathFileAbbelight.Value,'*.*'));
            end
            
            if app.pathFileAbbelight == 0 % if selection is  canceled
                if isempty(app.varPathFileAbbelight) == 0 % if a path already exist, use it
                    app.fileAbbelight = app.varFileAbbelight.Value;
                    app.pathFileAbbelight = app.varPathFileAbbelight.Value;
                else
                    app.fileAbbelight = '';
                    app.pathFileAbbelight = '';
                end
            else
                 try
                    app.varPathFileAbbelight.Value = [strrep(app.pathFileAbbelight,'\','/')];
                    app.varFileAbbelight.Value = app.fileAbbelight;
                    app.FileAbbelightField.Value = [strrep(app.pathFileAbbelight,'\','/'),app.fileAbbelight];
                catch
                end
            end
            
          app.SelectFileAbbelightButton.Enable = 'on';
          
        end

        % Button pushed function: SelectFileInscoperButton
        function SelectFileInscoperButtonPushed(app, event)
          app.SelectFileInscoperButton.Enable = 'off';
          
            if isempty(app.varPathFileInscoper) % file backup.mat doesnt exist yet
                [app.fileInscoper,app.pathFileInscoper] = uigetfile('*.*');
            else
                [app.fileInscoper,app.pathFileInscoper] = uigetfile(strcat(app.varPathFileInscoper.Value,'*.*'));
            end
            
            if app.pathFileInscoper == 0 % if selection is  canceled
                if isempty(app.varPathFileInscoper) == 0 % if a path already exist, use it
                    app.fileInscoper = app.varFileFileInscoper.Value;
                    app.pathFileInscoper = app.varPathFileInscoper.Value;
                else
                    app.fileInscoper = '';
                    app.pathFileInscoper = '';
                end
            else
                 try
                    app.varPathFileInscoper.Value = [strrep(app.pathFileInscoper,'\','/')];
                    app.varFileFileInscoper.Value = app.fileInscoper;
                    app.FileInscoperField.Value = [strrep(app.pathFileInscoper,'\','/'),app.fileInscoper];
                catch
                end
            end
            
          app.SelectFileInscoperButton.Enable = 'on';

        end

        % Button pushed function: AdjustGFPButton
        function AdjustGFPButtonPushed(app, event)
            
            if app.GFPChannel0CheckBox.Value == 1 && app.OtherButton.Value == 0
                
               close all;
               clc;
               
               % User experience
                app.Lamp.Enable='on';
                app.Lamp.Color='red';
                app.BusyLabel.Visible='on';
                app.timeLabel.Visible='off';
                app.AdjustGFPButton.Enable = 'off';
                app.WarningArea.Value = '';
                app.errorMessage = '';
                drawnow();
                tStartAdjust = tic;
                
                  try
                    % INSCOPER
                    if app.AcquisitionsoftwareButtonGroup.SelectedObject == app.InscoperButton
                        
                        % GLOBAL FOLDER
                        if app.StreamGroup.SelectedObject == app.GlobalfolderButton
                            varFolderValue = app.curFolderField.Value;
                            if isempty(varFolderValue) == 1
                                app.errorMessage = strcat(app.errorMessage, 'Missing path to raw images');
                            end
                            filepattern=fullfile(varFolderValue, '*c0*.tif');
                            tiffFiles=dir(filepattern); % dir list the contents of a folder
                            
                        % RAW DATA FOLDER
                        elseif app.StreamGroup.SelectedObject == app.MultipleImagesButton
                            varFolderValue = app.GlobalFolderField.Value;
                            if isempty(varFolderValue) == 1
                                app.errorMessage = strcat(app.errorMessage, 'Missing path to raw images');
                            end
                            filepattern=fullfile(varFolderValue, '*c0*.tif');
                            tiffFiles=dir(filepattern); % dir list the contents of a folder
                            
                        % ONLY ONE FILE
                        else
                            varFolderValue = app.pathFileInscoper;
                            if isempty(varFolderValue) == 1
                                app.errorMessage = strcat(app.errorMessage, 'Missing path to raw images');
                            end
                            if isempty(strfind(app.fileInscoper,'c0')) == 0 && isempty(strfind(app.fileInscoper,'.tif')) == 0
                                tiffFiles=dir(strcat(varFolderValue,app.fileInscoper)) ; % dir list the contents of a folder                          
                            else
                                app.errorMessage = strcat(app.errorMessage, ' / Channel 0 (*c0*.tif) not found in file name');
                            end
                        end
                        
                        if isempty(tiffFiles) == 1 && isempty(varFolderValue) == 0
                            app.errorMessage = strcat(app.errorMessage, ' / Incorrect path to access raw images');
                        end
                        
                    % ABBELIGHT    
                    elseif app.AcquisitionsoftwareButtonGroup.SelectedObject == app.AbbelightButton
                        
                        % RAW DATA FOLDER
                      % IF work on a folder
                        if app.StreamGroup.SelectedObject ~= app.OnlyOneFileButton
                            varFolderValue = app.FolderAbbelightField.Value;
                            if isempty(varFolderValue) == 1
                                app.errorMessage = strcat(app.errorMessage, 'Missing path to raw images');
                            end
                            filepattern = fullfile(varFolderValue, 'ROI2*.tif');
                            tiffFiles = dir(filepattern);
                            
                        % ONLY ONE FILE
                        else
                            varFolderValue = app.pathFileAbbelight;
                            if isempty(varFolderValue) == 1
                                app.errorMessage = strcat(app.errorMessage, 'Missing path to raw images');
                            end
                            if isempty(strfind(app.fileAbbelight,'ROI2')) == 0 && isempty(strfind(app.fileAbbelight,'.tif')) == 0
                                tiffFiles=dir(strcat(varFolderValue,app.fileAbbelight)) ; % dir list the contents of a folder                          
                            else
                                app.errorMessage = strcat(app.errorMessage, ' / Channel ROI2 (ROI2*.tif) not found in file name');
                            end
                        end

                        if isempty(tiffFiles) == 1 && isempty(varFolderValue) == 0
                            app.errorMessage = strcat(app.errorMessage, ' / Incorrect path to access raw images');
                        end
                    end
                    
                    % LOAD img
                    % ---------------------------------------------------
    
                    baseFileName = tiffFiles(1).name;
                    varSpeckleperimage = app.SpeckleperimageField.Value;
    
                    [img] = loadImgPreview (app, varFolderValue, baseFileName, varSpeckleperimage);

                    % ---------------------------------------------------
                    
                    [wienerParam] = adjustWiener(app,img,app.pathPsfEmission,app.filePsfEmission,app.expFactorPSFField.Value, app.wienerParamField.Value);
                    app.wienerParamField.Value = wienerParam;

                  catch
                    if isempty(app.errorMessage) == 0
                        app.WarningArea.Value = app.errorMessage;
                    else
                        app.WarningArea.Value = 'Missing parameters';
                    end

                  end
                
                temps=toc(tStartAdjust);
                s = seconds(temps);
                s.Format = 'hh:mm:ss';
                
                app.Lamp.Enable='off';
                app.Lamp.Color='green';
                app.BusyLabel.Visible='off';
                
                app.timeLabel.Text=strcat('Time : ',string(s));
                app.timeLabel.Visible='on';
                app.AdjustGFPButton.Enable = 'on';
                
            else
                app.WarningArea.Value ='Checkbox unchecked';
            end
            
            %% ----- OTHER
            if app.OtherButton.Value == 1
            
               close all;
               clc;
               
               % User experience
                app.Lamp.Enable='on';
                app.Lamp.Color='red';
                app.BusyLabel.Visible='on';
                app.timeLabel.Visible='off';
                app.AdjustGFPButton.Enable = 'off';
                app.WarningArea.Value = '';
                app.errorMessage = '';
                drawnow();
                tStartAdjust = tic;
                
                  try
                    % IF work on a folder
                    if app.StreamGroup.SelectedObject ~= app.OnlyOneFileButton

                        % Current folder
                        varFolderValue = app.folderOtherField.Value;
                        if isempty(varFolderValue) == 1
                            app.errorMessage = strcat(app.errorMessage, 'Missing path to raw images');
                        end
                    else
                        % Current folder
                        varFolderValue = app.pathFileOther;
                        if isempty(varFolderValue) == 1
                            app.errorMessage = strcat(app.errorMessage, 'Missing path to raw images');
                        end
                    end
                    filepattern = fullfile(varFolderValue, '*.tif');
                    tiffFiles = dir(filepattern);
                    if isempty(tiffFiles) == 1 && isempty(varFolderValue) == 0
                        app.errorMessage = strcat(app.errorMessage, ' / Incorrect path to access raw images');
                    end

                    % LOAD img
                    % ---------------------------------------------------
    
                    baseFileName = tiffFiles(1).name;
                    varSpeckleperimage = app.SpeckleperimageField.Value;
    
                    [img] = loadImgPreview (app, varFolderValue, baseFileName, varSpeckleperimage);

                    % ---------------------------------------------------
                        
                    [wienerParam] = adjustWiener(app,img,app.pathPsfEmission,app.filePsfEmission,app.expFactorPSFField.Value, app.wienerParamField.Value);
                    app.wienerParamField.Value = wienerParam;
                    
                 catch
                    if isempty(app.errorMessage) == 0
                        app.WarningArea.Value = app.errorMessage;
                    else
                        app.WarningArea.Value = 'Missing parameters';
                    end
                 end
                
                temps=toc(tStartAdjust);
                s = seconds(temps);
                s.Format = 'hh:mm:ss';
                
                app.Lamp.Enable='off';
                app.Lamp.Color='green';
                app.BusyLabel.Visible='off';
                
                app.timeLabel.Text=strcat('Time : ',string(s));
                app.timeLabel.Visible='on';
                app.AdjustGFPButton.Enable = 'on';
                
            end
        end

        % Button pushed function: AdjustRFPButton
        function AdjustRFPButtonPushed(app, event)
             if app.RFPChannel1CheckBox.Value == 1  && app.OtherButton.Value == 0
                close all;
                clc;

                % User experience
                app.Lamp.Enable='on';
                app.Lamp.Color='red';
                app.BusyLabel.Visible='on';
                app.timeLabel.Visible='off';
                app.AdjustRFPButton.Enable = 'off';
                app.WarningArea.Value = '';
                app.errorMessage = '';
                drawnow();
                tStartAdjust = tic;
                try
                    % INSCOPER
                    if app.AcquisitionsoftwareButtonGroup.SelectedObject == app.InscoperButton
                        
                        % GLOBAL FOLDER
                        if app.StreamGroup.SelectedObject == app.GlobalfolderButton
                            varFolderValue = app.curFolderField.Value;
                            if isempty(varFolderValue) == 1
                                app.errorMessage = strcat(app.errorMessage, 'Missing path to raw images');
                            end
                            filepattern=fullfile(varFolderValue, '*c1*.tif');
                            tiffFiles=dir(filepattern); % dir list the contents of a folder
                            
                        % RAW DATA FOLDER    
                        elseif app.StreamGroup.SelectedObject == app.MultipleImagesButton
                            varFolderValue = app.GlobalFolderField.Value;
                            if isempty(varFolderValue) == 1
                                app.errorMessage = strcat(app.errorMessage, 'Missing path to raw images');
                            end
                            filepattern=fullfile(varFolderValue, '*c1*.tif');
                            tiffFiles=dir(filepattern); % dir list the contents of a folder
                            
                        % ONLY ONE FILE
                        else
                            varFolderValue = app.pathFileInscoper;
                            if isempty(varFolderValue) == 1
                                app.errorMessage = strcat(app.errorMessage, 'Missing path to raw images');
                            end
                            if isempty(strfind(app.fileInscoper,'c1')) == 0 && isempty(strfind(app.fileInscoper,'.tif')) == 0
                                tiffFiles=dir(strcat(varFolderValue,app.fileInscoper)) ; % dir list the contents of a folder                          
                            else
                                app.errorMessage = strcat(app.errorMessage, ' / Channel 1 (*c1*.tif) not found in file name');
                            end
                        end

                        if isempty(tiffFiles) == 1 && isempty(varFolderValue) == 0
                            app.errorMessage = strcat(app.errorMessage, ' / Incorrect path to access raw images');
                        end
                        
                    %ABBELIGHT
                    elseif app.AcquisitionsoftwareButtonGroup.SelectedObject == app.AbbelightButton
                        
                        % RAW DATA FOLDER
                         % IF work on a folder
                        if app.StreamGroup.SelectedObject ~= app.OnlyOneFileButton

                            varFolderValue = app.FolderAbbelightField.Value;
                            if isempty(varFolderValue) == 1
                                app.errorMessage = strcat(app.errorMessage, 'Missing path to raw images');
                            end
                            filepattern = fullfile(varFolderValue, 'ROI1*.tif');
                            tiffFiles = dir(filepattern);
                            
                        % ONLY ONE FILE
                        else
                            varFolderValue = app.pathFileAbbelight;
                            if isempty(varFolderValue) == 1
                                app.errorMessage = strcat(app.errorMessage, 'Missing path to raw images');
                            end
                            if isempty(strfind(app.fileAbbelight,'ROI1')) == 0 && isempty(strfind(app.fileAbbelight,'.tif')) == 0
                                tiffFiles=dir(strcat(varFolderValue,app.fileAbbelight)) ; % dir list the contents of a folder                          
                            else
                                app.errorMessage = strcat(app.errorMessage, ' / Channel ROI1 (ROI1*.tif) not found in file name');
                            end
                        end

                        if isempty(tiffFiles) == 1 && isempty(varFolderValue) == 0
                            app.errorMessage = strcat(app.errorMessage, ' / Incorrect path to access raw images');
                        end
                    end

                    % LOAD img
                    % ---------------------------------------------------
    
                    baseFileName = tiffFiles(1).name;
                    varSpeckleperimage = app.SpeckleperimageField.Value;
    
                    [img] = loadImgPreview (app, varFolderValue, baseFileName, varSpeckleperimage);

                    % ---------------------------------------------------

                    [wienerParam] = adjustWiener(app,img,app.pathPsfEmission_2,app.filePsfEmission_2,app.expFactorPSFField_2.Value,app.wienerParamField_2.Value);
                    
                    app.wienerParamField_2.Value = wienerParam;

                catch
                    if isempty(app.errorMessage) == 0
                        app.WarningArea.Value = app.errorMessage;
                    else
                        app.WarningArea.Value = 'Missing parameters';
                    end
                end
                
                temps=toc(tStartAdjust);
                s = seconds(temps);
                s.Format = 'hh:mm:ss';
                
                app.Lamp.Enable='off';
                app.Lamp.Color='green';
                app.BusyLabel.Visible='off';
                
                app.timeLabel.Text=strcat('Time : ',string(s));
                app.timeLabel.Visible='on';
                app.AdjustRFPButton.Enable = 'on';
                
            else
                app.WarningArea.Value ='Checkbox unchecked';
            end

        end

        % Button pushed function: HelpGlobalFolderButton
        function HelpGlobalFolderButtonPushed(app, event)
            app.HelpGlobalFolderButton.Enable = 'off';

            app.DialogApp = InterfaceAideGlobalFolderAlgoRIM;
            
            app.HelpGlobalFolderButton.Enable = 'on';

        end

        % Button pushed function: SelectFolderOtherButton
        function SelectFolderOtherButtonPushed(app, event)
            app.SelectFolderOtherButton.Enable = 'off';
  
            app.pathFolderOther = [strrep(uigetdir(app.folderOtherField.Value),'\','/'),'/'];
            if app.pathFolderOther ~= 0 % if the selection is not canceled
                try
                    app.folderOtherField.Value = app.pathFolderOther;
                catch
                end
            end
          app.SelectFolderOtherButton.Enable = 'on';
        end

        % Button pushed function: SelectFileOtherButton
        function SelectFileOtherButtonPushed(app, event)
            
            app.SelectFileOtherButton.Enable = 'off';
            
            if isempty(app.varPathFileOther) % file backup.mat doesnt exist yet
                [app.fileFileOther,app.pathFileOther] = uigetfile('*.*');
            else
                [app.fileFileOther,app.pathFileOther] = uigetfile(strcat(app.varPathFileOther.Value,'*.*'));
            end
            
            if app.pathFileOther == 0 % if selection is  canceled
                if isempty(app.varPathFileOther) == 0 % if a path already exist, use it
                    app.fileFileOther = app.varFileFileOther.Value;
                    app.pathFileOther = app.varPathFileOther.Value;
                else
                    app.fileFileOther = '';
                    app.pathFileOther = '';
                end
            else
                 try
                    app.varPathFileOther.Value = [strrep(app.pathFileOther,'\','/')];
                    app.varFileFileOther.Value = app.fileFileOther;
                    app.fileOtherField.Value = [strrep(app.pathFileOther,'\','/'),app.fileFileOther];
                catch
                end
            end
            app.SelectFileOtherButton.Enable = 'on';

        end

        % Button pushed function: ConditionsofuseButton
        function ConditionsofuseButtonPushed(app, event)
            app.ConditionsofuseButton.Enable = 'off';

            app.DialogApp2 = InterfaceConditionsOfUseAlgoRIM;
            
            app.ConditionsofuseButton.Enable = 'on';
        end
    

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.AutoResizeChildren = 'off';
            app.UIFigure.Color = [1 1 1];
            app.UIFigure.Position = [100 50 1119 806];
            app.UIFigure.Name = 'UI Figure';
            app.UIFigure.CloseRequestFcn = createCallbackFcn(app, @UIFigureCloseRequest, true);
            app.UIFigure.Scrollable = 'on';

            % Create Image2
            app.Image2 = uiimage(app.UIFigure);
            app.Image2.Enable = 'off';
            app.Image2.Position = [1 1 1119 683];
            app.Image2.ImageSource = 'background2.png';

            % Create SelectPanel
            app.SelectPanel = uipanel(app.UIFigure);
            app.SelectPanel.AutoResizeChildren = 'off';
            app.SelectPanel.TitlePosition = 'centertop';
            app.SelectPanel.Title = '3. Select';
            app.SelectPanel.BackgroundColor = [1 1 1];
            app.SelectPanel.FontWeight = 'bold';
            app.SelectPanel.FontSize = 14;
            app.SelectPanel.Position = [170 406 765 105];

            % Create RawimagefolderLabel_3
            app.RawimagefolderLabel_3 = uilabel(app.SelectPanel);
            app.RawimagefolderLabel_3.Position = [30 49 99 22];
            app.RawimagefolderLabel_3.Text = 'Raw image folder';

            % Create GlobalFolderField
            app.GlobalFolderField = uieditfield(app.SelectPanel, 'text');
            app.GlobalFolderField.Editable = 'off';
            app.GlobalFolderField.FontSize = 11;
            app.GlobalFolderField.Position = [136 49 492 22];

            % Create SelectGlobalFolderButton
            app.SelectGlobalFolderButton = uibutton(app.SelectPanel, 'push');
            app.SelectGlobalFolderButton.ButtonPushedFcn = createCallbackFcn(app, @SelectGlobalFolderButtonValueChanged, true);
            app.SelectGlobalFolderButton.Position = [641 50 100 22];
            app.SelectGlobalFolderButton.Text = 'Select';

            % Create RawimagefolderLabel_2
            app.RawimagefolderLabel_2 = uilabel(app.SelectPanel);
            app.RawimagefolderLabel_2.Visible = 'off';
            app.RawimagefolderLabel_2.Position = [30 49 99 22];
            app.RawimagefolderLabel_2.Text = 'Raw image folder';

            % Create FolderAbbelightField
            app.FolderAbbelightField = uieditfield(app.SelectPanel, 'text');
            app.FolderAbbelightField.Editable = 'off';
            app.FolderAbbelightField.FontSize = 11;
            app.FolderAbbelightField.Visible = 'off';
            app.FolderAbbelightField.Position = [136 49 492 22];

            % Create SelectFolderAbbelightButton
            app.SelectFolderAbbelightButton = uibutton(app.SelectPanel, 'push');
            app.SelectFolderAbbelightButton.ButtonPushedFcn = createCallbackFcn(app, @SelectFolderAbbelightButtonPushed, true);
            app.SelectFolderAbbelightButton.Visible = 'off';
            app.SelectFolderAbbelightButton.Position = [641 50 100 22];
            app.SelectFolderAbbelightButton.Text = 'Select';

            % Create SelectFileAbbelightButton
            app.SelectFileAbbelightButton = uibutton(app.SelectPanel, 'push');
            app.SelectFileAbbelightButton.ButtonPushedFcn = createCallbackFcn(app, @SelectFileAbbelightButtonPushed, true);
            app.SelectFileAbbelightButton.Visible = 'off';
            app.SelectFileAbbelightButton.Position = [641 50 100 22];
            app.SelectFileAbbelightButton.Text = 'Select file';

            % Create AbbelightfileLabel
            app.AbbelightfileLabel = uilabel(app.SelectPanel);
            app.AbbelightfileLabel.Visible = 'off';
            app.AbbelightfileLabel.Position = [30 49 96 22];
            app.AbbelightfileLabel.Text = 'Abbelight file';

            % Create FileAbbelightField
            app.FileAbbelightField = uieditfield(app.SelectPanel, 'text');
            app.FileAbbelightField.Editable = 'off';
            app.FileAbbelightField.FontSize = 11;
            app.FileAbbelightField.Visible = 'off';
            app.FileAbbelightField.Position = [136 49 492 22];

            % Create SelectFileInscoperButton
            app.SelectFileInscoperButton = uibutton(app.SelectPanel, 'push');
            app.SelectFileInscoperButton.ButtonPushedFcn = createCallbackFcn(app, @SelectFileInscoperButtonPushed, true);
            app.SelectFileInscoperButton.Visible = 'off';
            app.SelectFileInscoperButton.Position = [641 50 100 22];
            app.SelectFileInscoperButton.Text = 'Select file';

            % Create InscoperfileEditFieldLabel
            app.InscoperfileEditFieldLabel = uilabel(app.SelectPanel);
            app.InscoperfileEditFieldLabel.Visible = 'off';
            app.InscoperfileEditFieldLabel.Position = [30 49 96 22];
            app.InscoperfileEditFieldLabel.Text = 'Inscoper file';

            % Create FileInscoperField
            app.FileInscoperField = uieditfield(app.SelectPanel, 'text');
            app.FileInscoperField.Editable = 'off';
            app.FileInscoperField.FontSize = 11;
            app.FileInscoperField.Visible = 'off';
            app.FileInscoperField.Position = [136 49 492 22];

            % Create FolderforpreviewLabel
            app.FolderforpreviewLabel = uilabel(app.SelectPanel);
            app.FolderforpreviewLabel.HorizontalAlignment = 'right';
            app.FolderforpreviewLabel.VerticalAlignment = 'top';
            app.FolderforpreviewLabel.Visible = 'off';
            app.FolderforpreviewLabel.Position = [21 10 101 22];
            app.FolderforpreviewLabel.Text = 'Folder for preview';

            % Create curFolderField
            app.curFolderField = uieditfield(app.SelectPanel, 'text');
            app.curFolderField.Editable = 'off';
            app.curFolderField.FontSize = 11;
            app.curFolderField.Visible = 'off';
            app.curFolderField.Position = [136 13 492 22];

            % Create SelectCurFolderButton
            app.SelectCurFolderButton = uibutton(app.SelectPanel, 'push');
            app.SelectCurFolderButton.ButtonPushedFcn = createCallbackFcn(app, @SelectCurFolderButtonPushed, true);
            app.SelectCurFolderButton.Visible = 'off';
            app.SelectCurFolderButton.Position = [641 9 100 22];
            app.SelectCurFolderButton.Text = 'Select';

            % Create GlobalfolderLabel
            app.GlobalfolderLabel = uilabel(app.SelectPanel);
            app.GlobalfolderLabel.Visible = 'off';
            app.GlobalfolderLabel.Position = [31 49 103 22];
            app.GlobalfolderLabel.Text = 'Global folder';

            % Create RawimagefolderLabel
            app.RawimagefolderLabel = uilabel(app.SelectPanel);
            app.RawimagefolderLabel.Visible = 'off';
            app.RawimagefolderLabel.Position = [30 49 99 22];
            app.RawimagefolderLabel.Text = 'Raw image folder';

            % Create folderOtherField
            app.folderOtherField = uieditfield(app.SelectPanel, 'text');
            app.folderOtherField.Editable = 'off';
            app.folderOtherField.Visible = 'off';
            app.folderOtherField.Position = [136 49 492 22];

            % Create SelectFolderOtherButton
            app.SelectFolderOtherButton = uibutton(app.SelectPanel, 'push');
            app.SelectFolderOtherButton.ButtonPushedFcn = createCallbackFcn(app, @SelectFolderOtherButtonPushed, true);
            app.SelectFolderOtherButton.Visible = 'off';
            app.SelectFolderOtherButton.Position = [641 50 100 22];
            app.SelectFolderOtherButton.Text = 'Select';

            % Create SelectFileOtherButton
            app.SelectFileOtherButton = uibutton(app.SelectPanel, 'push');
            app.SelectFileOtherButton.ButtonPushedFcn = createCallbackFcn(app, @SelectFileOtherButtonPushed, true);
            app.SelectFileOtherButton.Visible = 'off';
            app.SelectFileOtherButton.Position = [641 50 100 22];
            app.SelectFileOtherButton.Text = 'Select file';

            % Create fileOtherField
            app.fileOtherField = uieditfield(app.SelectPanel, 'text');
            app.fileOtherField.Editable = 'off';
            app.fileOtherField.Visible = 'off';
            app.fileOtherField.Position = [136 49 493 22];

            % Create Panel
            app.Panel = uipanel(app.UIFigure);
            app.Panel.AutoResizeChildren = 'off';
            app.Panel.TitlePosition = 'centertop';
            app.Panel.BackgroundColor = [1 1 1];
            app.Panel.FontWeight = 'bold';
            app.Panel.FontSize = 14;
            app.Panel.Position = [11 102 540 296];

            % Create commentExpFactor
            app.commentExpFactor = uilabel(app.Panel);
            app.commentExpFactor.FontSize = 11;
            app.commentExpFactor.FontAngle = 'italic';
            app.commentExpFactor.Visible = 'off';
            app.commentExpFactor.Position = [31 138 254 22];
            app.commentExpFactor.Text = 'Physical size of pixels will be divided by this factor.';

            % Create commentExpFactorPSF
            app.commentExpFactorPSF = uilabel(app.Panel);
            app.commentExpFactorPSF.FontSize = 11;
            app.commentExpFactorPSF.FontAngle = 'italic';
            app.commentExpFactorPSF.Visible = 'off';
            app.commentExpFactorPSF.Position = [31 83 247 22];
            app.commentExpFactorPSF.Text = 'Physical size must be the same as for the image.';

            % Create GFPChannel0CheckBox
            app.GFPChannel0CheckBox = uicheckbox(app.Panel);
            app.GFPChannel0CheckBox.ValueChangedFcn = createCallbackFcn(app, @GFPChannel0CheckBoxValueChanged, true);
            app.GFPChannel0CheckBox.Text = 'GFP / Channel 0 / ROI2';
            app.GFPChannel0CheckBox.FontSize = 14;
            app.GFPChannel0CheckBox.FontWeight = 'bold';
            app.GFPChannel0CheckBox.Position = [186 267 174 22];

            % Create SelectPsfEmissionButton
            app.SelectPsfEmissionButton = uibutton(app.Panel, 'push');
            app.SelectPsfEmissionButton.ButtonPushedFcn = createCallbackFcn(app, @SelectPsfEmissionButtonPushed, true);
            app.SelectPsfEmissionButton.Visible = 'off';
            app.SelectPsfEmissionButton.Position = [451 237 78 22];
            app.SelectPsfEmissionButton.Text = 'Select';

            % Create SelectPsfExcitationButton
            app.SelectPsfExcitationButton = uibutton(app.Panel, 'push');
            app.SelectPsfExcitationButton.ButtonPushedFcn = createCallbackFcn(app, @SelectPsfExcitationButtonPushed, true);
            app.SelectPsfExcitationButton.Visible = 'off';
            app.SelectPsfExcitationButton.Position = [451 204 78 22];
            app.SelectPsfExcitationButton.Text = 'Select';

            % Create PSFemissionLabel
            app.PSFemissionLabel = uilabel(app.Panel);
            app.PSFemissionLabel.HorizontalAlignment = 'center';
            app.PSFemissionLabel.Visible = 'off';
            app.PSFemissionLabel.Position = [6 236 91 22];
            app.PSFemissionLabel.Text = 'PSF emission';

            % Create psfEmissionField
            app.psfEmissionField = uieditfield(app.Panel, 'text');
            app.psfEmissionField.Editable = 'off';
            app.psfEmissionField.FontSize = 11;
            app.psfEmissionField.Visible = 'off';
            app.psfEmissionField.Position = [107 236 335 22];

            % Create PSFexcitationLabel
            app.PSFexcitationLabel = uilabel(app.Panel);
            app.PSFexcitationLabel.HorizontalAlignment = 'center';
            app.PSFexcitationLabel.Visible = 'off';
            app.PSFexcitationLabel.Position = [7 206 90 22];
            app.PSFexcitationLabel.Text = 'PSF excitation';

            % Create psfExcitationField
            app.psfExcitationField = uieditfield(app.Panel, 'text');
            app.psfExcitationField.Editable = 'off';
            app.psfExcitationField.FontSize = 11;
            app.psfExcitationField.Visible = 'off';
            app.psfExcitationField.Position = [107 205 336 22];

            % Create LaunchpreviewGFPButton
            app.LaunchpreviewGFPButton = uibutton(app.Panel, 'push');
            app.LaunchpreviewGFPButton.ButtonPushedFcn = createCallbackFcn(app, @LaunchpreviewGFPButtonPushed, true);
            app.LaunchpreviewGFPButton.Visible = 'off';
            app.LaunchpreviewGFPButton.Position = [205 10 136 23];
            app.LaunchpreviewGFPButton.Text = 'Launch preview';

            % Create PrefilteringparameterLabel
            app.PrefilteringparameterLabel = uilabel(app.Panel);
            app.PrefilteringparameterLabel.Visible = 'off';
            app.PrefilteringparameterLabel.Position = [321 104 125 22];
            app.PrefilteringparameterLabel.Text = 'Pre-filtering parameter';

            % Create wienerParamField
            app.wienerParamField = uispinner(app.Panel);
            app.wienerParamField.Step = 0.001;
            app.wienerParamField.Limits = [0 Inf];
            app.wienerParamField.Visible = 'off';
            app.wienerParamField.Position = [453 104 81 22];
            app.wienerParamField.Value = 0.001;

            % Create NumberofiterationsSpinnerLabel
            app.NumberofiterationsSpinnerLabel = uilabel(app.Panel);
            app.NumberofiterationsSpinnerLabel.Visible = 'off';
            app.NumberofiterationsSpinnerLabel.Position = [322 159 123 22];
            app.NumberofiterationsSpinnerLabel.Text = 'Number of iterations';

            % Create numItField
            app.numItField = uispinner(app.Panel);
            app.numItField.Limits = [1 Inf];
            app.numItField.ValueDisplayFormat = '%.0f';
            app.numItField.Visible = 'off';
            app.numItField.Position = [453 159 81 22];
            app.numItField.Value = 4;

            % Create PSFexpansionfactorSpinnerLabel
            app.PSFexpansionfactorSpinnerLabel = uilabel(app.Panel);
            app.PSFexpansionfactorSpinnerLabel.Visible = 'off';
            app.PSFexpansionfactorSpinnerLabel.Position = [31 104 129 22];
            app.PSFexpansionfactorSpinnerLabel.Text = 'PSF expansion factor';

            % Create expFactorPSFField
            app.expFactorPSFField = uispinner(app.Panel);
            app.expFactorPSFField.Limits = [1 Inf];
            app.expFactorPSFField.ValueDisplayFormat = '%.0f';
            app.expFactorPSFField.Visible = 'off';
            app.expFactorPSFField.Position = [175 104 80 22];
            app.expFactorPSFField.Value = 1;

            % Create ImageexpansionfactorLabel
            app.ImageexpansionfactorLabel = uilabel(app.Panel);
            app.ImageexpansionfactorLabel.Visible = 'off';
            app.ImageexpansionfactorLabel.Position = [31 159 131 22];
            app.ImageexpansionfactorLabel.Text = 'Image expansion factor';

            % Create expFactorField
            app.expFactorField = uispinner(app.Panel);
            app.expFactorField.Limits = [1 Inf];
            app.expFactorField.ValueDisplayFormat = '%.0f';
            app.expFactorField.Visible = 'off';
            app.expFactorField.Position = [175 159 80 22];
            app.expFactorField.Value = 1;

            % Create WienerfilteringLabel
            app.WienerfilteringLabel = uilabel(app.Panel);
            app.WienerfilteringLabel.FontSize = 11;
            app.WienerfilteringLabel.FontAngle = 'italic';
            app.WienerfilteringLabel.Visible = 'off';
            app.WienerfilteringLabel.Position = [322 83 79 22];
            app.WienerfilteringLabel.Text = 'Wiener filtering';

            % Create AdjustGFPButton
            app.AdjustGFPButton = uibutton(app.Panel, 'push');
            app.AdjustGFPButton.ButtonPushedFcn = createCallbackFcn(app, @AdjustGFPButtonPushed, true);
            app.AdjustGFPButton.Visible = 'off';
            app.AdjustGFPButton.Position = [453 74 58 22];
            app.AdjustGFPButton.Text = 'Adjust';

            % Create OnechannelLabel
            app.OnechannelLabel = uilabel(app.Panel);
            app.OnechannelLabel.FontSize = 14;
            app.OnechannelLabel.FontWeight = 'bold';
            app.OnechannelLabel.Visible = 'off';
            app.OnechannelLabel.Position = [216 267 90 22];
            app.OnechannelLabel.Text = 'One channel';

            % Create RegularizationparameterSpinnerLabel
            app.RegularizationparameterSpinnerLabel = uilabel(app.Panel);
            app.RegularizationparameterSpinnerLabel.Visible = 'off';
            app.RegularizationparameterSpinnerLabel.Position = [31 53 140 22];
            app.RegularizationparameterSpinnerLabel.Text = 'Regularization parameter';

            % Create RegularizationparameterSpinner
            app.RegularizationparameterSpinner = uispinner(app.Panel);
            app.RegularizationparameterSpinner.Step = 0.0001;
            app.RegularizationparameterSpinner.Limits = [0 Inf];
            app.RegularizationparameterSpinner.Visible = 'off';
            app.RegularizationparameterSpinner.Position = [175 53 80 22];

            % Create LaunchPanel
            app.LaunchPanel = uipanel(app.UIFigure);
            app.LaunchPanel.AutoResizeChildren = 'off';
            app.LaunchPanel.TitlePosition = 'centertop';
            app.LaunchPanel.Title = 'Reconstruction and backup';
            app.LaunchPanel.BackgroundColor = [1 1 1];
            app.LaunchPanel.FontWeight = 'bold';
            app.LaunchPanel.FontSize = 14;
            app.LaunchPanel.Position = [367 16 377 75];

            % Create LaunchButton
            app.LaunchButton = uibutton(app.LaunchPanel, 'push');
            app.LaunchButton.ButtonPushedFcn = createCallbackFcn(app, @LaunchButtonPushed, true);
            app.LaunchButton.Position = [274 10 90 31];
            app.LaunchButton.Text = 'Launch';

            % Create IntensifysignalbySpinnerLabel
            app.IntensifysignalbySpinnerLabel = uilabel(app.LaunchPanel);
            app.IntensifysignalbySpinnerLabel.HorizontalAlignment = 'right';
            app.IntensifysignalbySpinnerLabel.Position = [136 28 101 22];
            app.IntensifysignalbySpinnerLabel.Text = 'Intensify signal by';

            % Create IntensifysignalbySpinner
            app.IntensifysignalbySpinner = uispinner(app.LaunchPanel);
            app.IntensifysignalbySpinner.Limits = [1 Inf];
            app.IntensifysignalbySpinner.Position = [162 6 56 22];
            app.IntensifysignalbySpinner.Value = 10;

            % Create CutofffrequencySpinnerLabel
            app.CutofffrequencySpinnerLabel = uilabel(app.LaunchPanel);
            app.CutofffrequencySpinnerLabel.HorizontalAlignment = 'right';
            app.CutofffrequencySpinnerLabel.Position = [11 28 93 22];
            app.CutofffrequencySpinnerLabel.Text = 'Cutoff frequency';

            % Create CutofffrequencySpinner
            app.CutofffrequencySpinner = uispinner(app.LaunchPanel);
            app.CutofffrequencySpinner.Step = 0.01;
            app.CutofffrequencySpinner.Limits = [0.0001 1];
            app.CutofffrequencySpinner.Position = [22 6 68 22];
            app.CutofffrequencySpinner.Value = 0.3472;

            % Create Panel_2
            app.Panel_2 = uipanel(app.UIFigure);
            app.Panel_2.AutoResizeChildren = 'off';
            app.Panel_2.TitlePosition = 'centertop';
            app.Panel_2.BackgroundColor = [1 1 1];
            app.Panel_2.FontWeight = 'bold';
            app.Panel_2.FontSize = 14;
            app.Panel_2.Position = [559 102 540 296];

            % Create commentExpFactor_2
            app.commentExpFactor_2 = uilabel(app.Panel_2);
            app.commentExpFactor_2.FontSize = 11;
            app.commentExpFactor_2.FontAngle = 'italic';
            app.commentExpFactor_2.Visible = 'off';
            app.commentExpFactor_2.Position = [26 138 254 22];
            app.commentExpFactor_2.Text = 'Physical size of pixels will be divided by this factor.';

            % Create commentExpFactorPSF_2
            app.commentExpFactorPSF_2 = uilabel(app.Panel_2);
            app.commentExpFactorPSF_2.FontSize = 11;
            app.commentExpFactorPSF_2.FontAngle = 'italic';
            app.commentExpFactorPSF_2.Visible = 'off';
            app.commentExpFactorPSF_2.Position = [26 83 276 22];
            app.commentExpFactorPSF_2.Text = 'Physical size must be the same as for the image.';

            % Create RFPChannel1CheckBox
            app.RFPChannel1CheckBox = uicheckbox(app.Panel_2);
            app.RFPChannel1CheckBox.ValueChangedFcn = createCallbackFcn(app, @RFPChannel1CheckBoxValueChanged, true);
            app.RFPChannel1CheckBox.Text = 'RFP / Channel 1 / ROI1';
            app.RFPChannel1CheckBox.FontSize = 14;
            app.RFPChannel1CheckBox.FontWeight = 'bold';
            app.RFPChannel1CheckBox.Position = [199 267 173 22];

            % Create SelectPsfEmissionButton_2
            app.SelectPsfEmissionButton_2 = uibutton(app.Panel_2, 'push');
            app.SelectPsfEmissionButton_2.ButtonPushedFcn = createCallbackFcn(app, @SelectPsfEmissionButton_2Pushed, true);
            app.SelectPsfEmissionButton_2.Visible = 'off';
            app.SelectPsfEmissionButton_2.Position = [451 237 78 22];
            app.SelectPsfEmissionButton_2.Text = 'Select';

            % Create SelectPsfExcitationButton_2
            app.SelectPsfExcitationButton_2 = uibutton(app.Panel_2, 'push');
            app.SelectPsfExcitationButton_2.ButtonPushedFcn = createCallbackFcn(app, @SelectPsfExcitationButton_2Pushed, true);
            app.SelectPsfExcitationButton_2.Visible = 'off';
            app.SelectPsfExcitationButton_2.Position = [451 204 78 22];
            app.SelectPsfExcitationButton_2.Text = 'Select';

            % Create PSFemissionLabel_2
            app.PSFemissionLabel_2 = uilabel(app.Panel_2);
            app.PSFemissionLabel_2.HorizontalAlignment = 'center';
            app.PSFemissionLabel_2.Visible = 'off';
            app.PSFemissionLabel_2.Position = [10 236 97 22];
            app.PSFemissionLabel_2.Text = 'PSF emission';

            % Create psfEmissionField_2
            app.psfEmissionField_2 = uieditfield(app.Panel_2, 'text');
            app.psfEmissionField_2.Editable = 'off';
            app.psfEmissionField_2.FontSize = 11;
            app.psfEmissionField_2.Visible = 'off';
            app.psfEmissionField_2.Position = [123 236 318 22];

            % Create PSFexcitationLabel_2
            app.PSFexcitationLabel_2 = uilabel(app.Panel_2);
            app.PSFexcitationLabel_2.HorizontalAlignment = 'center';
            app.PSFexcitationLabel_2.Visible = 'off';
            app.PSFexcitationLabel_2.Position = [12 205 96 22];
            app.PSFexcitationLabel_2.Text = 'PSF excitation';

            % Create psfExcitationField_2
            app.psfExcitationField_2 = uieditfield(app.Panel_2, 'text');
            app.psfExcitationField_2.Editable = 'off';
            app.psfExcitationField_2.FontSize = 11;
            app.psfExcitationField_2.Visible = 'off';
            app.psfExcitationField_2.Position = [124 205 317 22];

            % Create LaunchpreviewRFPButton
            app.LaunchpreviewRFPButton = uibutton(app.Panel_2, 'push');
            app.LaunchpreviewRFPButton.ButtonPushedFcn = createCallbackFcn(app, @LaunchpreviewRFPButtonPushed, true);
            app.LaunchpreviewRFPButton.Visible = 'off';
            app.LaunchpreviewRFPButton.Position = [216 10 139 23];
            app.LaunchpreviewRFPButton.Text = 'Launch preview';

            % Create PrefilteringparameterLabel_2
            app.PrefilteringparameterLabel_2 = uilabel(app.Panel_2);
            app.PrefilteringparameterLabel_2.Visible = 'off';
            app.PrefilteringparameterLabel_2.Position = [305 104 125 22];
            app.PrefilteringparameterLabel_2.Text = 'Pre-filtering parameter';

            % Create wienerParamField_2
            app.wienerParamField_2 = uispinner(app.Panel_2);
            app.wienerParamField_2.Step = 0.001;
            app.wienerParamField_2.Limits = [0 Inf];
            app.wienerParamField_2.Visible = 'off';
            app.wienerParamField_2.Position = [449 104 80 22];
            app.wienerParamField_2.Value = 0.001;

            % Create NumberofiterationsSpinnerLabel_2
            app.NumberofiterationsSpinnerLabel_2 = uilabel(app.Panel_2);
            app.NumberofiterationsSpinnerLabel_2.Visible = 'off';
            app.NumberofiterationsSpinnerLabel_2.Position = [305 159 109 22];
            app.NumberofiterationsSpinnerLabel_2.Text = 'Number of iterations';

            % Create numItField_2
            app.numItField_2 = uispinner(app.Panel_2);
            app.numItField_2.Limits = [1 Inf];
            app.numItField_2.ValueDisplayFormat = '%.0f';
            app.numItField_2.Visible = 'off';
            app.numItField_2.Position = [449 159 80 22];
            app.numItField_2.Value = 4;

            % Create PSFexpansionfactorSpinnerLabel_2
            app.PSFexpansionfactorSpinnerLabel_2 = uilabel(app.Panel_2);
            app.PSFexpansionfactorSpinnerLabel_2.Visible = 'off';
            app.PSFexpansionfactorSpinnerLabel_2.Position = [26 104 131 22];
            app.PSFexpansionfactorSpinnerLabel_2.Text = 'PSF expansion factor';

            % Create expFactorPSFField_2
            app.expFactorPSFField_2 = uispinner(app.Panel_2);
            app.expFactorPSFField_2.Limits = [1 Inf];
            app.expFactorPSFField_2.ValueDisplayFormat = '%.0f';
            app.expFactorPSFField_2.Visible = 'off';
            app.expFactorPSFField_2.Position = [170 104 80 22];
            app.expFactorPSFField_2.Value = 1;

            % Create ImageexpansionfactorLabel_2
            app.ImageexpansionfactorLabel_2 = uilabel(app.Panel_2);
            app.ImageexpansionfactorLabel_2.Visible = 'off';
            app.ImageexpansionfactorLabel_2.Position = [26 159 131 22];
            app.ImageexpansionfactorLabel_2.Text = 'Image expansion factor';

            % Create expFactorField_2
            app.expFactorField_2 = uispinner(app.Panel_2);
            app.expFactorField_2.Limits = [1 Inf];
            app.expFactorField_2.ValueDisplayFormat = '%.0f';
            app.expFactorField_2.Visible = 'off';
            app.expFactorField_2.Position = [170 159 80 22];
            app.expFactorField_2.Value = 1;

            % Create WienerfilteringLabel_2
            app.WienerfilteringLabel_2 = uilabel(app.Panel_2);
            app.WienerfilteringLabel_2.FontSize = 11;
            app.WienerfilteringLabel_2.FontAngle = 'italic';
            app.WienerfilteringLabel_2.Visible = 'off';
            app.WienerfilteringLabel_2.Position = [305 83 79 22];
            app.WienerfilteringLabel_2.Text = 'Wiener filtering';

            % Create AdjustRFPButton
            app.AdjustRFPButton = uibutton(app.Panel_2, 'push');
            app.AdjustRFPButton.ButtonPushedFcn = createCallbackFcn(app, @AdjustRFPButtonPushed, true);
            app.AdjustRFPButton.Visible = 'off';
            app.AdjustRFPButton.Position = [449 74 57 22];
            app.AdjustRFPButton.Text = 'Adjust';

            % Create RegularizationparameterSpinner_2Label
            app.RegularizationparameterSpinner_2Label = uilabel(app.Panel_2);
            app.RegularizationparameterSpinner_2Label.Visible = 'off';
            app.RegularizationparameterSpinner_2Label.Position = [25 53 140 22];
            app.RegularizationparameterSpinner_2Label.Text = 'Regularization parameter';

            % Create RegularizationparameterSpinner_2
            app.RegularizationparameterSpinner_2 = uispinner(app.Panel_2);
            app.RegularizationparameterSpinner_2.Step = 0.0001;
            app.RegularizationparameterSpinner_2.Limits = [0 Inf];
            app.RegularizationparameterSpinner_2.Visible = 'off';
            app.RegularizationparameterSpinner_2.Position = [170 53 80 22];

            % Create StreamGroup
            app.StreamGroup = uibuttongroup(app.UIFigure);
            app.StreamGroup.AutoResizeChildren = 'off';
            app.StreamGroup.SelectionChangedFcn = createCallbackFcn(app, @StreamGroupSelectionChanged, true);
            app.StreamGroup.TitlePosition = 'centertop';
            app.StreamGroup.Title = '2. Input data';
            app.StreamGroup.BackgroundColor = [1 1 1];
            app.StreamGroup.FontWeight = 'bold';
            app.StreamGroup.FontSize = 14;
            app.StreamGroup.Position = [447 521 488 145];

            % Create GlobalfolderButton
            app.GlobalfolderButton = uiradiobutton(app.StreamGroup);
            app.GlobalfolderButton.Text = 'Global folder';
            app.GlobalfolderButton.Position = [14 93 90 22];

            % Create MultipleImagesButton
            app.MultipleImagesButton = uiradiobutton(app.StreamGroup);
            app.MultipleImagesButton.Text = 'Raw data folder';
            app.MultipleImagesButton.Position = [14 62 106 22];
            app.MultipleImagesButton.Value = true;

            % Create OnlyOneFileButton
            app.OnlyOneFileButton = uiradiobutton(app.StreamGroup);
            app.OnlyOneFileButton.Text = 'Only 1 file (Stream)';
            app.OnlyOneFileButton.Position = [14 32 125 22];

            % Create ButtonGroup
            app.ButtonGroup = uibuttongroup(app.StreamGroup);
            app.ButtonGroup.AutoResizeChildren = 'off';
            app.ButtonGroup.SelectionChangedFcn = createCallbackFcn(app, @ButtonGroupSelectionChanged, true);
            app.ButtonGroup.BackgroundColor = [1 1 1];
            app.ButtonGroup.Position = [144 0 344 124];

            % Create SequentialButton
            app.SequentialButton = uiradiobutton(app.ButtonGroup);
            app.SequentialButton.Text = 'Sequential';
            app.SequentialButton.Position = [7 42 79 22];

            % Create InterleavedButton
            app.InterleavedButton = uiradiobutton(app.ButtonGroup);
            app.InterleavedButton.Text = 'Interleaved';
            app.InterleavedButton.Position = [6 14 81 22];

            % Create SpecklespersequenceLabel
            app.SpecklespersequenceLabel = uilabel(app.ButtonGroup);
            app.SpecklespersequenceLabel.Visible = 'off';
            app.SpecklespersequenceLabel.Position = [130 61 130 22];
            app.SpecklespersequenceLabel.Text = 'Speckles per sequence';

            % Create SpeckleperimageField
            app.SpeckleperimageField = uieditfield(app.ButtonGroup, 'numeric');
            app.SpeckleperimageField.Limits = [1 Inf];
            app.SpeckleperimageField.ValueDisplayFormat = '%.0f';
            app.SpeckleperimageField.Visible = 'off';
            app.SpeckleperimageField.Position = [267 61 58 22];
            app.SpeckleperimageField.Value = 1;

            % Create GapbeforeoverlapLabel
            app.GapbeforeoverlapLabel = uilabel(app.ButtonGroup);
            app.GapbeforeoverlapLabel.Visible = 'off';
            app.GapbeforeoverlapLabel.Position = [130 32 108 22];
            app.GapbeforeoverlapLabel.Text = 'Gap before overlap';

            % Create OverlapField
            app.OverlapField = uieditfield(app.ButtonGroup, 'numeric');
            app.OverlapField.Limits = [0 Inf];
            app.OverlapField.ValueDisplayFormat = '%.0f';
            app.OverlapField.Visible = 'off';
            app.OverlapField.Position = [267 33 58 22];

            % Create FilereconstructionmodeLabel
            app.FilereconstructionmodeLabel = uilabel(app.ButtonGroup);
            app.FilereconstructionmodeLabel.Position = [6 99 144 22];
            app.FilereconstructionmodeLabel.Text = 'File reconstruction mode :';

            % Create OverlapLabel
            app.OverlapLabel = uilabel(app.ButtonGroup);
            app.OverlapLabel.FontSize = 11;
            app.OverlapLabel.FontAngle = 'italic';
            app.OverlapLabel.Visible = 'off';
            app.OverlapLabel.Position = [131 13 198 22];
            app.OverlapLabel.Text = 'Improves time resolution and denoising';

            % Create FullFileButton
            app.FullFileButton = uiradiobutton(app.ButtonGroup);
            app.FullFileButton.Text = 'Full file';
            app.FullFileButton.Position = [7 71 79 22];
            app.FullFileButton.Value = true;

            % Create HelpGlobalFolderButton
            app.HelpGlobalFolderButton = uibutton(app.StreamGroup, 'push');
            app.HelpGlobalFolderButton.ButtonPushedFcn = createCallbackFcn(app, @HelpGlobalFolderButtonPushed, true);
            app.HelpGlobalFolderButton.Position = [105 94 16 22];
            app.HelpGlobalFolderButton.Text = '?';

            % Create subtitle
            app.subtitle = uilabel(app.UIFigure);
            app.subtitle.HorizontalAlignment = 'center';
            app.subtitle.FontSize = 14;
            app.subtitle.FontWeight = 'bold';
            app.subtitle.FontAngle = 'italic';
            app.subtitle.Position = [309 706 491 22];
            app.subtitle.Text = 'RIM image reconstruction algorithm (Mangeat, et al.Cell.Rep.Meth,2021)';

            % Create AcquisitionsoftwareButtonGroup
            app.AcquisitionsoftwareButtonGroup = uibuttongroup(app.UIFigure);
            app.AcquisitionsoftwareButtonGroup.AutoResizeChildren = 'off';
            app.AcquisitionsoftwareButtonGroup.SelectionChangedFcn = createCallbackFcn(app, @AcquisitionsoftwareButtonGroupSelectionChanged, true);
            app.AcquisitionsoftwareButtonGroup.TitlePosition = 'centertop';
            app.AcquisitionsoftwareButtonGroup.Title = '1. Acquisition software';
            app.AcquisitionsoftwareButtonGroup.BackgroundColor = [1 1 1];
            app.AcquisitionsoftwareButtonGroup.FontWeight = 'bold';
            app.AcquisitionsoftwareButtonGroup.FontSize = 14;
            app.AcquisitionsoftwareButtonGroup.Position = [174 522 260 144];

            % Create InscoperButton
            app.InscoperButton = uiradiobutton(app.AcquisitionsoftwareButtonGroup);
            app.InscoperButton.Text = 'Inscoper';
            app.InscoperButton.Position = [11 92 68 22];
            app.InscoperButton.Value = true;

            % Create AbbelightButton
            app.AbbelightButton = uiradiobutton(app.AcquisitionsoftwareButtonGroup);
            app.AbbelightButton.Text = 'Abbelight';
            app.AbbelightButton.Position = [11 61 72 22];

            % Create OtherButton
            app.OtherButton = uiradiobutton(app.AcquisitionsoftwareButtonGroup);
            app.OtherButton.Text = 'Other (ex: Micromanager...)';
            app.OtherButton.Position = [11 31 169 22];

            % Create Image
            app.Image = uiimage(app.UIFigure);
            app.Image.Position = [454 732 206 70];
            app.Image.ImageSource = 'logoAlgoRIM2.jpg';

            % Create StateAndTime
            app.StateAndTime = uipanel(app.UIFigure);
            app.StateAndTime.AutoResizeChildren = 'off';
            app.StateAndTime.BackgroundColor = [1 1 1];
            app.StateAndTime.Position = [776 16 323 75];

            % Create Lamp
            app.Lamp = uilamp(app.StateAndTime);
            app.Lamp.HandleVisibility = 'callback';
            app.Lamp.Enable = 'off';
            app.Lamp.Position = [100 43 29 29];

            % Create BusyLabel
            app.BusyLabel = uilabel(app.StateAndTime);
            app.BusyLabel.Visible = 'off';
            app.BusyLabel.Position = [142 45 154 22];
            app.BusyLabel.Text = 'Busy';

            % Create CurrentstateLabel
            app.CurrentstateLabel = uilabel(app.StateAndTime);
            app.CurrentstateLabel.HorizontalAlignment = 'center';
            app.CurrentstateLabel.Position = [15 45 78 22];
            app.CurrentstateLabel.Text = 'Current state:';

            % Create timeLabel
            app.timeLabel = uilabel(app.StateAndTime);
            app.timeLabel.Visible = 'off';
            app.timeLabel.Position = [18 14 210 22];
            app.timeLabel.Text = 'time';

            % Create ConditionsofuseButton
            app.ConditionsofuseButton = uibutton(app.UIFigure, 'push');
            app.ConditionsofuseButton.ButtonPushedFcn = createCallbackFcn(app, @ConditionsofuseButtonPushed, true);
            app.ConditionsofuseButton.BackgroundColor = [0.9804 0.9804 0.9804];
            app.ConditionsofuseButton.FontSize = 11;
            app.ConditionsofuseButton.FontAngle = 'italic';
            app.ConditionsofuseButton.Position = [806 706 100 22];
            app.ConditionsofuseButton.Text = 'Conditions of use';

            % Create Hyperlink
            app.Hyperlink = uihyperlink(app.UIFigure);
            app.Hyperlink.URL = 'https://doi.org/10.1016/j.crmeth.2021.100009';
            app.Hyperlink.Position = [422 683 259 22];
            app.Hyperlink.Text = 'https://doi.org/10.1016/j.crmeth.2021.100009';

            % Create Hyperlink2
            app.Hyperlink2 = uihyperlink(app.UIFigure);
            app.Hyperlink2.URL = 'cell-rep-meth.rim-microscope.fr';
            app.Hyperlink2.Position = [1027 769 82 22];
            app.Hyperlink2.Text = 'AlgoRIM V1.2';

            % Create WarningArea
            app.WarningArea = uitextarea(app.UIFigure);
            app.WarningArea.Editable = 'off';
            app.WarningArea.FontColor = [1 0 0];
            app.WarningArea.Position = [11 16 323 76];

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
   

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = InterfaceAlgoRIM21

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            % Execute the startup function
            runStartupFcn(app, @startupFcn)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
