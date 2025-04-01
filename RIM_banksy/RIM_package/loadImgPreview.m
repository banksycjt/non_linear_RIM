function [img] = loadImgPreview (app, varFolderValue, baseFileName, varSpeckleperimage)
% varFolderValue : path of tiffFiles    
% baseFileName : name of the first tiff
% varSpeckleperimage : app.SpeckleperimageField.Value = 1
    % If SEQUENTIAL or INTERLEAVED
    if app.ButtonGroup.SelectedObject == app.SequentialButton || app.ButtonGroup.SelectedObject == app.InterleavedButton
        
        %% Preview the middle speckles
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