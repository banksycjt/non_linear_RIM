function out = mExpand(in, sizeOut, domain)

    % in : matrix, size is the same as image
    % sizeOut : 1*2 double e.g.[256,256]
    
    if(nargin<3)
       domain = 'real'; 
    end
    
    if( isequal( size(in) , sizeOut ) )
       out = in;
       return;
    end

    %
    if( domain == 'real' )
        ftIn = fftshift(fftn(in));
    elseif( domain == 'fourier' )
        ftIn = fftshift(in);
    end

    ftIn = mExtract(ftIn, sizeOut);
    
    out =  ifftshift(ftIn);

    if(domain=='real')
       out = ifftn(out); 
    end

   

end