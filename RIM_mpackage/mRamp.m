%
%
%
%
%
%
%
%
%
%
%
%
%
%
%
%
%
%
%
%
%
%
%
%
%
%
%
%
%
function [ out ] = mRamp( sizeIm, dir , methods)
    
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

