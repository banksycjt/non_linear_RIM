%% initializtion

addpath(genpath('E:\banksycjt_git\non_linear_RIM\non_linear_RIM\RIM_mpackage'))

RawPicturePath = 'E:\OneDrive - stu.ecnu.edu.cn\collected_images2.tiff';
tiffFiles = dir(RawPicturePath); % tiffFiles : struct of information of the tiffs
img = mLoadImg(RawPicturePath, [], [], [], 0);  % image in cells

numFilt = 3;  % needed for otfs calculation
cutFreq = 0.2; % cutoff frequency
varExpFactorFieldValue = 2; % Image expansion factor, physical size of pixels will be divided by this factor.
curSize = varExpFactorFieldValue*size(img{1}); % expand image
varShowImages = 1; % 1 represent show all the image
varNumItFieldValue = 20;% varNumItFieldValue : number of iteration
varRegularisationParameter = 0.15; %L2 parmeter

varPathPsfEmission = 'E:\banksycjt_git\non_linear_RIM\non_linear_RIM\line_pair\';
varFilePsfEmission = 'PSF512_520nm.tif' ;
varExpFactorPSFFieldValue = 1; % psf expansion factor, physical size of pixels will be divided by this factor.
varPathPsfExcitation = 'E:\banksycjt_git\non_linear_RIM\non_linear_RIM\line_pair\';
varFilePsfExcitation = 'PSF512_488nm.tif' ;
varWienerParamFieldValue = 0.15; % varWienerParamFieldValue : Wiener filtering parameter


%% otfsCalculation

[otfs, otfCol, otfIllu, preFilt ] = otfsCalculation(varPathPsfEmission, varFilePsfEmission,varExpFactorPSFFieldValue, ...
    curSize,varPathPsfExcitation,varFilePsfExcitation,varWienerParamFieldValue,numFilt);


%% rimFullProcV2

[ inputVar, medVar ] = rimFullProcV2(img, varExpFactorFieldValue, cutFreq, otfCol, preFilt,varShowImages);

expFact = varExpFactorFieldValue;

%% rimReconNewton

rimReconNewton( varShowImages, inputVar, otfs, varNumItFieldValue,  varRegularisationParameter, 6, 1e-2, [] );
