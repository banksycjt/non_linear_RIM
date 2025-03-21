
function [ otfs, S] = simFiltersVariance( otfCol, otfIllu, k)
    
    curSize  = size(otfCol);
    n = prod(curSize);
    psf = ifftn(otfCol);
    %
    
    %

    %
    %
    %
    %
    %
    
    %
    [U,S] = eigs(@(x) testMultSigma(x),n,k );
    
    %
    U = U*sqrt(S);
    S = diag(S);
    otfs = fft2( reshape( U, [curSize k]   )); %
    otfs = num2cell(otfs,[1 2]); %
    %
    
    %
    
    %
    %
    %
    %
    function z = testMultSigma(x)    
        z = reshape(x,curSize); %
        z = psf.*z; %
        z = ifftn( fftn(z).*otfIllu); %
        z = psf.*z; %
        z = real(z(:));        
    end
    

end

