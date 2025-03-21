in = magic(4);
sizeOut = [2*size(in),4];

curNumDims = max(ndims(in),numel(sizeOut) );

pos =  zeros(1 ,curNumDims);

val = 0;
    
s1 = size(in);
s1(end+1 : curNumDims) = 1;
s2 = sizeOut;
s2(end+1 : curNumDims) = 1;

pos(end+1 : curNumDims) = 1;

c1 = floor(s1/2)+1;
c2 = floor(s2/2)+1;
   
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