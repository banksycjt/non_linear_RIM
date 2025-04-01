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

function [ img, listFileName ] = mLoadImg( fileOrDir , id, curSize,curPos, isFncHdl )
    
    if( nargin<2 || isequal(id,[]) )
        id = -1;
    end
    if( nargin<3 || isequal(curSize,[]) )
        curSize = -1;
    end
    if( nargin<4 || isequal(curPos,[]) )
        curPos = [0 0];
    end
    if( nargin<5 || isequal(isFncHdl,[]) )
        isFncHdl = 0;
    end

    if( exist( fileOrDir, 'file'  ) == 2 )
%
       
       listFileName = fileOrDir;
       %
       [ ~ , ~ , ext ] = fileparts(fileOrDir);
       
       switch( ext )
           case { '.mat'  '.txt' }
                img = load( fileOrDir );
           case { '.png' '.PNG' '.bmp' '.BMP'}
               if( isFncHdl )
                   img = [ 'double( imread(''' fileOrDir ''' ) )' ];
                   if(~isequal(curSize,-1))
                       img = [ 'mExtract(' img ' , ' mat2str(curSize) ',' mat2str(curPos) ')' ];
                   end
                   img = [img ';' ];
               else
                   img = double( imread( fileOrDir ) );  
                   if( ~isequal( curSize, -1) )
                       img = mExtract( img, curSize, curPos );
                   end
               end
               
           case { '.tif' '.tiff' }
               
               info = imfinfo( fileOrDir );
               N = numel( info );
               arId = id;
               if( isequal( id , -1 ) )
                  arId = 1:N;
               end
               img = cell( numel(arId) , 1 );
               for i = 1:numel( arId )
                   if( 0<arId(i) && arId(i)<=N )
                       
                       if( isFncHdl )
                           temp = [ 'double( imread(''' fileOrDir ''' , ' num2str(arId(i)) ' ) )' ];
                           if(~isequal(curSize,-1))
                               temp = [ 'mExtract(' temp  ' , ' mat2str(curSize) ',' mat2str(curPos) ' )' ];
                           end
                           temp = [ temp ';'];
                       else
                           temp = double( imread( fileOrDir, arId(i) ) );
                           if( ~isequal( curSize , -1))
                               temp = mExtract( temp , curSize , curPos);
                           end
                       end                       
                       img{i}  = temp;
                       
                   end
               end
               if( numel(img) == 1 )
                   img = img{1};
               end
               
       end
       
    elseif( isfolder( fileOrDir ) || ischar( fileOrDir ) )
        
        curRegExp = '';
        if( ischar( fileOrDir ) )
            [ filepath , curRegExp , ext ] = fileparts(fileOrDir);
        else
            filepath = fileOrDir;
        end
        curRegExp = strrep( curRegExp ,'*', '\d+' );

        %
        temp =  dir( filepath );
        temp = temp(3:end);        
        isValideFile = zeros(numel(temp),1);
        
        if( isequal(curRegExp,'') )
            p = min( 50, numel(temp));
            maxCmLtr = 0;
            cmStr = '';
            posCmStr = 0;

            for i = 1 : p
                arJ = randperm(numel(temp),p);
                nameI = temp(i).name;
                nameI = nameI( isletter(nameI) ); 
                for j = 1:p
                    nameJ = temp( arJ(j) ).name;
                    nameJ = nameJ( isletter(nameJ) ); 
                    t = min(numel(nameI),numel(nameJ));
                    t = sum(nameI(1,1:t) == nameJ(1,1:t) );
                    if( t > maxCmLtr )
                        maxCmLtr = t;
                        posCmStr = nameI==nameJ;
                        cmStr = nameI(posCmStr);
                    end
                end
            end
            t = numel(posCmStr);
        end

        for i = 1:numel(temp)        
            if( isfile( [ temp(i).folder '/' temp(i).name ] ) )
                if( isequal(curRegExp,'')) 
                    nameI = temp(i).name;
                    nameI = nameI( isletter(nameI) ); 

                    if( numel(nameI) == t &&  isequal( nameI(posCmStr) , cmStr  ) )
                       isValideFile(i) = 1;
                    end
                elseif( regexp(  temp(i).name ,  [ '^' curRegExp ext] ) )
                    isValideFile(i) = 1;
                end
            end
        end
        temp = temp(logical(isValideFile)); 
        N = numel(temp);
        truc = zeros(size(temp));
        for i = 1:numel(temp)
           truc(i) = str2num( regexprep( temp(i).name , '[^0-9]' , '' ));
        end
       [~,I] = sort(truc);
       temp = temp(I);
       
        arId = id;
        if( isequal( id , -1 ) )
        	arId = 1:numel(temp);
        end
        
        img = cell( numel(arId) , 1 );
        listFileName = cell( numel(arId) , 1 );
        for i = 1:numel( arId )
            if( 0<arId(i) && arId(i)<=N )
                listFileName{i} = temp( arId(i) ).name;
                if( isFncHdl )
                    img{i} = mLoadImg( [ temp( arId(i) ).folder '\' temp( arId(i) ).name ] , -1 , curSize, curPos, 2 );
                else
                    img{i} = mLoadImg( [ temp( arId(i) ).folder '\' temp( arId(i) ).name ] , -1 , curSize , curPos);
                end
            end
        end
              
    else
        fprintf('Format not reconized yet !!!\n');
        img = {};       
    end
    
    if( ~isFncHdl && numel(img) == 1 )
       img = img{1}; 
    end
    
    if( isFncHdl == 1 )
        if(iscell(img))
            img = mImgAccessor(img);
        else
            img = mImgAccessor({img});
        end
    end

end

