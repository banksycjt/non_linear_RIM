RawPicturePath = 'D:\RIM\data\ROI1_SUM_image_43_800.tif';
tiffFiles = dir(RawPicturePath);
numFilt = 3;
cutFreq = 0.5;
img = mLoadImg(RawPicturePath, [], [], [], 0);
varExpFactorFieldValue = 2;
curSize = varExpFactorFieldValue*size(img{1});
varShowImages = 1;
varNumItFieldValue = 4;
varRegularisationParameter = 0.15;

varPathPsfEmission = 'D:\RIM\data\PSF\';
varFilePsfEmission = 'PSF256_520nm.tif' ;
varExpFactorPSFFieldValue = 2;
varPathPsfExcitation = 'D:\RIM\data\PSF\';
varFilePsfExcitation = 'PSF256_405nm.tif' ;
varWienerParamFieldValue = 0.05;

[otfs, otfCol, otfIllu, preFilt ] = otfsCalculation(varPathPsfEmission, varFilePsfEmission,varExpFactorPSFFieldValue, ...
    curSize,varPathPsfExcitation,varFilePsfExcitation,varWienerParamFieldValue,numFilt);


%% rimReconNewton

[ inputVar, medVar ] = rimFullProcV2(img, varExpFactorFieldValue, cutFreq, otfCol, preFilt,varShowImages);

expFact = varExpFactorFieldValue;

%% rimReconNewton

%rimReconNewton( varShowImages, inputVar, otfs, varNumItFieldValue,  varRegularisationParameter, 6, 1e-2, [] );

showImages = varShowImages;
variance = inputVar;
numItMax = varNumItFieldValue;
L2param = varRegularisationParameter;
Bmod = 6;
tolCGS = 1e-2;
initGuess = [];

