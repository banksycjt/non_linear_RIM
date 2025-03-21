function [ inputVar, medVar ] = rimFullProcV2( img, expFact, cutFreq, otfCol, preFilt, showImages )
%funtion for variation claulation 

%input:
%img:
%expFact:
%cutFreg:
%otfCol:
%preFilt：
%showImages:

%% init
    numImg = numel(img);
    curSize = size(img{1});  
    expSize = expFact*curSize;
    
    %
    assert( isequal(size(otfCol), expSize) );
    

    clear preFiltParamOrPreFilt
    preFilt2 = fft2( abs(ifft2(preFilt)) .^2 );
    
  maskNoisePart  = 1-ifftshift( mPupil(curSize, cutFreq));
    
    mask2 = real(fft2(   abs(ifft2(maskNoisePart)).^2   ));
    mask2 = conj(mask2) ./ ( abs(mask2).^2 );
    
    %

    meanNoisePart = zeros(curSize);
    varNoisePart  = zeros(curSize);
    meanImg       = zeros(curSize);
    varImg        = zeros(curSize);
    meanFiltImg   = zeros(expSize);
    varFiltImg    = zeros(expSize); %

    parfor i = 1:numImg
        
        %
        
        curImg = img{i};        
        curFtImg = fft2( curImg );
                
        curFiltImg = ifftshift(mExtract( fftshift(curFtImg) ,  expSize ));
        curFiltImg = ifft2( preFilt .* curFiltImg );
        
        meanImg = meanImg + curImg;
        varImg  = varImg + abs(curImg).^2;
        meanFiltImg   = meanFiltImg + curFiltImg;
        varFiltImg    = varFiltImg  + abs(curFiltImg).^2; 
        
        %
        
        noisePart  = ifft2( maskNoisePart .* curFtImg ); %
        meanNoisePart = meanNoisePart + noisePart; %
        varNoisePart  = varNoisePart  + abs(noisePart).^2; %
        
    end
   
    clear curImg curFtImg curFiltImg maskNoisePart preFilt
    
    %

    meanImg       = meanImg   ./ numImg;
    varImg        = varImg    ./ numImg - abs( meanImg ).^2;
    meanFiltImg   = meanFiltImg   ./ numImg;
    varFiltImg    = varFiltImg    ./ numImg - abs( meanFiltImg ).^2;
    
    %

    meanNoisePart = meanNoisePart ./ numImg;
    varNoisePart  = varNoisePart  ./ numImg - abs( meanNoisePart ).^2; %
    varNoisePart = real( ifft2( fft2(varNoisePart) .* mask2 )); %
    
    %
    
    %
    %
    
    noiseVarFilt = mExpand( varNoisePart , expSize ); %
    noiseVarFilt = real( ifft2( fft2(noiseVarFilt) .* preFilt2 )); %
    
	clear varNoisePart preFilt2 mask2
    
    %
    if(showImages==1)
        
        screenSize = get(0,'screensize');
        screenWidth = screenSize(3);
        screenHeight = screenSize(4);
        f1 = figure();
        %
        f1.Position = [0 0 screenWidth/3 screenHeight];%
        curImg = real(img{1});
        imagesc(curImg);
        %
        title('One raw speckle image');
        colorbar;
        colormap gray;
        axis square;
        drawnow;

        f2 = figure();
        f2.Position = [screenWidth/3 0 screenWidth/3 screenHeight];%
        imagesc(real(meanFiltImg));
        title('Average of pre-filtered raw images');
        colorbar;
        colormap gray;
        axis square;
        drawnow;
        
        %
        f3 = figure();
        f3.Position = [2*(screenWidth/3) 0 screenWidth/3 screenHeight];%
        imagesc(sqrt(real(varFiltImg)));
        title('Standard deviation');
        colorbar;
        colormap gray;
        axis square;
        drawnow;
        
    end

    %
  
    %
    %
    %
    
    medVar = median(varFiltImg(:));
    inputVar = (varFiltImg - noiseVarFilt )./ medVar;
    %
    %
    
    inputVar = max( real(inputVar) , 0 ); %

%

%
%

end
