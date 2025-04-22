%% initializtion
clear;close all;clc;
addpath(genpath('D:\OneDrive - stu.ecnu.edu.cn\non_linear_RIM\RIM_mpackage'))

RawPicturePath = 'D:\OneDrive - stu.ecnu.edu.cn\RIMrecon_line_pair_256_400_488_520\collected_images256_400frame_520488nm.tiff';
tiffFiles = dir(RawPicturePath); % tiffFiles : struct of information of the tiffs
img = mLoadImg(RawPicturePath, [], [], [], 0);  % image in cells

numFilt = 3;  % needed for otfs calculation
cutFreq = 0.2; % cutoff frequency
varExpFactorFieldValue = 2; % Image expansion factor, physical size of pixels will be divided by this factor.
curSize = varExpFactorFieldValue*size(img{1}); % expand image
varShowImages = 1; % 1 represent show all the image
varNumItFieldValue = 20;% varNumItFieldValue : number of iteration
varRegularisationParameter = 0.15; %L2 parmeter

varPathPsfEmission = 'D:\OneDrive - stu.ecnu.edu.cn\RIMrecon_line_pair_256_400_488_520\';
varFilePsfEmission = 'PSF256_520nm.tif' ;
varExpFactorPSFFieldValue = 1; % psf expansion factor, physical size of pixels will be divided by this factor.
varPathPsfExcitation = 'D:\OneDrive - stu.ecnu.edu.cn\RIMrecon_line_pair_256_400_488_520\';
varFilePsfExcitation = 'PSF256_488nm.tif' ;
varWienerParamFieldValue = 0.15; % varWienerParamFieldValue : Wiener filtering parameter


%% otfsCalculation

[otfs, otfCol, otfIllu, preFilt ] = otfsCalculation(varPathPsfEmission, varFilePsfEmission,varExpFactorPSFFieldValue, ...
    curSize,varPathPsfExcitation,varFilePsfExcitation,varWienerParamFieldValue,numFilt);


%% rimFullProcV2

[ inputVar, medVar ] = rimFullProcV2(img, varExpFactorFieldValue, cutFreq, otfCol, preFilt,varShowImages);

expFact = varExpFactorFieldValue;

%% rimReconNewton

rimReconNewton( varShowImages, inputVar, otfs, varNumItFieldValue,  varRegularisationParameter, 6, 1e-2, [] );
