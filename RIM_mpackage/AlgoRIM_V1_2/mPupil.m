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
function pupil = mPupil( sizeIm, cutFreq )
    if(cutFreq==0)
        pupil = zeros(sizeIm);
    else
        pupil =  (double(mRR(sizeIm, 'freq') <= cutFreq))  ;
    end
end

