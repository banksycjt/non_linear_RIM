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

function out = mExpand(in, sizeOut, domain)
    
    %
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