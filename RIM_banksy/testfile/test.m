%% initializtion

RawPicturePath = 'E:/tutoAlgoRIM/data/ROI1_SUM_image_43_800.tif';
tiffFiles = dir(RawPicturePath);
baseFileName = tiffFiles(1).name;
numFilt = 3; % needed for otfs calculation
cutFreq = 0.2;
img = mLoadImg(RawPicturePath, [], [], [], 0);
varExpFactorFieldValue = 2;
curSize = varExpFactorFieldValue*size(img{1});
varShowImages = 1;
varNumItFieldValue = 100;
varRegularisationParameter = 0.15;

varPathPsfEmission = 'E:/tutoAlgoRIM/data/PSF/';
varFilePsfEmission = 'PSF256_520nm.tif' ;
varExpFactorPSFFieldValue = 1;
varPathPsfExcitation = 'E:/tutoAlgoRIM/data/PSF/';
varFilePsfExcitation = 'PSF256_405nm.tif' ;
varWienerParamFieldValue = 0.05;

% %% rimFullProcV2
% 
% [otfs, otfCol, otfIllu, preFilt ] = otfsCalculation(varPathPsfEmission, varFilePsfEmission,varExpFactorPSFFieldValue, ...
%     curSize,varPathPsfExcitation,varFilePsfExcitation,varWienerParamFieldValue,numFilt);
% 
% 
% %% rimReconNewton
% 
% [ inputVar, medVar ] = rimFullProcV2(img, varExpFactorFieldValue, cutFreq, otfCol, preFilt,varShowImages);
% 
% expFact = varExpFactorFieldValue;
% 
% %% rimReconNewton
% 
% rimReconNewton( varShowImages, inputVar, otfs, varNumItFieldValue,  varRegularisationParameter, 6, 1e-2, [] );
% 
% showImages = varShowImages;
% variance = inputVar;
% numItMax = varNumItFieldValue;
% L2param = varRegularisationParameter;
% Bmod = 6;
% tolCGS = 1e-2;
% initGuess = [];
%%

% reconstruction(app,tiffFiles,varFolderValue,app.expFactorField.Value,app.pathPsfEmission,app.filePsfEmission, ...
%     app.expFactorPSFField.Value,app.pathPsfExcitation,app.filePsfExcitation,app.numItField.Value,app.wienerParamField.Value, ...
%     varshowImages, app.SpeckleperimageField.Value, app.OverlapField.Value, app.RegularizationparameterSpinner.Value, '');

% numFilt = 3; % needed for otfs calculation
% cutFreq = app.CutofffrequencySpinner.Value; % cutoff frequency
% 
% baseFileName = tiffFiles(1).name; % name of the first tiff
% nbFile = length(tiffFiles);
% 
% inputVar2 = cell(1,nbFile);
% medVar2 = cell(1,nbFile);
% 
% reconTab = cell(1,nbFile);
% meanPerImage = cell(1,nbFile);

% ----- IF PREVIEW

    
    % Image size
    % curSize = varExpFactorFieldValue*size(img{1});
    
    % OTFS : 
    [otfs, otfCol, otfIllu, preFilt ] = otfsCalculation(varPathPsfEmission, varFilePsfEmission,varExpFactorPSFFieldValue,curSize,varPathPsfExcitation,varFilePsfExcitation,varWienerParamFieldValue,numFilt);
    
    % rimFullProcV2 : show three pictures, one raw speckle image(the first one of img); average of pre-filtered
    % raw image(mean of all image); standard deviation(variance of filted images)

    [ inputVar, medVar ] = rimFullProcV2(img, varExpFactorFieldValue, cutFreq, otfCol, preFilt,varShowImages);
    
    % rimReconNewton
    rimReconNewton( varShowImages, inputVar, otfs, varNumItFieldValue,  varRegularisationParameter, 6, 1e-2, [] );

