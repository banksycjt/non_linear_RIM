function [ out ] = mRamp( sizeIm, dir , methods)
    
% sizeIm : size of Image， e.g. [256, 256]
% dir : 
% methods : 

% out : matrix of repmat, e.g. when dir = 1, out = [-128(256times); -127(256times); -126(256times); ...; 
% 126(256times); 127(256times)];when dir = 2, out is transpose of above matrix

    curNumDims = numel(sizeIm);

    if(nargin<2)
       dir=1; 
    end
    if(nargin<3)
       methods = 'norm'; 
    end
    if(dir>numel(sizeIm))
       out = zeros(sizeIm);
       return;
    end
                
    n = sizeIm(dir);
    vMax =  floor((n-1)/2);
    vMin = -floor((n  )/2);
    temp = vMin:vMax;
    if(vMin~=0)
        switch(methods)                
            case 'freq'
%
                temp = temp / n;
            case 'coord'
                temp = temp - vMin + 1;
        end
    end
    tempVectA = ones(1, curNumDims);
    tempVectA(dir) = n;
    tempVectB = sizeIm;
    tempVectB(dir) = 1;
    
    out = repmat(reshape(temp,tempVectA),tempVectB );
    
end

