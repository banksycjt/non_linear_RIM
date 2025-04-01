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