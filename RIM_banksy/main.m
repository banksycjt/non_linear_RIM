%% initializtion

addpath(genpath('Z:\caojuntong\code\RIM\RIM_package'))

RawPicturePath = 'Z:\caojuntong\code\RIM\data\collect_images_32bit.tif';
tiffFiles = dir(RawPicturePath); % tiffFiles : struct of information of the tiffs
img = mLoadImg(RawPicturePath, [], [], [], 0);  % image in cells

numFilt = 3;  % needed for otfs calculation
cutFreq = 0.2; % cutoff frequency
varExpFactorFieldValue = 2; % Image expansion factor, physical size of pixels will be divided by this factor.
curSize = varExpFactorFieldValue*size(img{1}); % expand image
varShowImages = 1; % 1 represent show all the image
varNumItFieldValue = 100;% varNumItFieldValue : number of iteration
varRegularisationParameter = 0.15; %L2 parmeter

varPathPsfEmission = 'Z:\caojuntong\data\PSF\';
varFilePsfEmission = 'PSF256_520nm.tif' ;
varExpFactorPSFFieldValue = 1; % psf expansion factor, physical size of pixels will be divided by this factor.
varPathPsfExcitation = 'Z:\caojuntong\data\PSF\';
varFilePsfExcitation = 'PSF256_405nm.tif' ;
varWienerParamFieldValue = 0.15; % varWienerParamFieldValue : Wiener filtering parameter

%% otfsCalculation

[otfs, otfCol, otfIllu, preFilt ] = otfsCalculation(varPathPsfEmission, varFilePsfEmission,varExpFactorPSFFieldValue, ...
    curSize,varPathPsfExcitation,varFilePsfExcitation,varWienerParamFieldValue,numFilt);


%% rimFullProcV2

[ inputVar, medVar ] = rimFullProcV2(img, varExpFactorFieldValue, cutFreq, otfCol, preFilt,varShowImages);

expFact = varExpFactorFieldValue;

%% rimReconNewton

rimReconNewton( varShowImages, inputVar, otfs, varNumItFieldValue,  varRegularisationParameter, 6, 1e-2, [] );
