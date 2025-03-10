function pupil = mPupil( sizeIm, cutFreq )

% sizeIm : size of Image , e.g. [256, 256]
% cutFreq : cutoff frequency
    if(cutFreq==0)
        pupil = zeros(sizeIm);
    else
        pupil =  (double(mRR(sizeIm, 'freq') <= cutFreq))  ;
    end
end

