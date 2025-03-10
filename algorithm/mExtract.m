function out = mExtract(in, sizeOut, pos, val)
    % in : matrix, size is the same as image
    % sizeOut : 1*2 double e.g.[256,256]
    
    curNumDims = max(ndims(in),numel(sizeOut) );

    if(nargin<2)
        out = in;
        return;
    end
    if(nargin<3 || isequal( pos,[] ) ) 
        pos =  zeros( 1 ,curNumDims);
    end
    assert( isequal(numel(pos), numel(sizeOut)) , sprintf('pos should be a vector of size (%d,1)', numel(sizeOut))  );


    if(nargin<4)
        val = 0;
    end
    
    
    %
    s1 = size(in);
    s1(end+1 : curNumDims) = 1;
    s2 = sizeOut;
    s2(end+1 : curNumDims) = 1;
    
    pos(end+1 : curNumDims) = 1;
    
    %
    c1 = floor(s1/2)+1;
    c2 = floor(s2/2)+1;
       
    %
    t = [c1-1;s1-c1] -  [c2-1;s2-c2] + [pos ; -pos];
    t1=t;
    t2=-t;
    t1(t1>0) = 0;
    t2(t2>0) = 0;
    s = s1 - sum(t,1);
    out = zeros(s)+val;

    strIdOut = '';
    strIdIn = '';
    for i =1:curNumDims
        if(i>1)
            strIdOut = [strIdOut ' , '];
            strIdIn = [strIdIn ' , '];
         end
       strIdOut = [strIdOut num2str(1-t1(1,i)) ':' num2str(size(out,i) + t1(2,i)) ''   ];
       strIdIn = [strIdIn num2str(1-t2(1,i)) ':' num2str( size(in,i) + t2(2,i)) ''   ];
    end
    
    eval( [ 'out('  strIdOut  ') = in( '  strIdIn   ');' ]);
    

end