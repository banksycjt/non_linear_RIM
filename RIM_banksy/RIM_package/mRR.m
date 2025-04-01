function [ out ] = mRR( sizeIm , methods )

% sizeIm : size of Image， e.g. [256, 256]
% methods : 
% curNumDims : 

    curNumDims = numel(sizeIm);
    
    if(nargin<2 )
        methods = 'norm';     
    end
    
    out = zeros(sizeIm);
    
    for i=1:curNumDims
        out = out +  (mRamp(sizeIm,i,methods)).^2;
    end
    out = sqrt(out);
    
end

