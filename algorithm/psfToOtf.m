function [ otf ] = psfToOtf( curFolderPSF,psfFile,expFactorPSF,curSize )
    %
    info = imfinfo([curFolderPSF psfFile],'tiff');
    numPSF = numel(info);
    psfImg = cell(numPSF,1);
    for i=1:numPSF
        psfImg{i} = double(imread( [curFolderPSF psfFile],'tif',i));
        %
    end
    %
    psf3D = cat(3,psfImg{:}); %
    clear psfImg;
    otf3D = fftn( ifftshift( psf3D)); %
    otf2D =  mean( otf3D,3); %
    otf2D =  otf2D./otf2D(1); %
    tmpSize = size(otf2D); 
     otf = (otf2D);

    tmpSize = expFactorPSF*tmpSize; %
    otf = ifftshift(mExtract(fftshift(otf),tmpSize));
    psf = fftshift( ifft2(otf));    
    otf = fft2(ifftshift( mExtract(psf,curSize))); %

end

