
% initializtion

RawPictureStackPath = 'E:/tutoAlgoRIM/data/ROI1_SUM_image_43_800.tif';
PSFEmissionPath = 'E:/tutoAlgoRIM/data/PSF/';
PSFEmissionFile = 'PSF256_520nm.tif' ;
PSFExcitationPath = 'E:/tutoAlgoRIM/data/PSF/';
PsfExcitationFile = 'PSF256_405nm.tif' ;

ImageExpandFactor = 1;
PSFExpandFactor = 1;
IterationNumber = 4;
WienerFilterParameter = 0.05;
ComparisonRawAndFilter = 'on';
RegularizationParameter = 0;
CutOffFrequency = 0.5;
IntensifySignal = 10;

varshowImages = 1;

% reconstruction

tiffFiles = dir(RawPictureStackPath);
varSpeckleperimage = 1;
varOverlapStream = 0;


reconstruction(tiffFiles,RawPictureStackPath,ImageExpandFactor,PSFEmissionPath,PSFEmissionFile, ...
    PSFExpandFactor,PSFExcitationPath,PsfExcitationFile,IterationNumber,WienerFilterParameter, ...
    varshowImages,varSpeckleperimage, varOverlapStream,RegularizationParameter, '');
