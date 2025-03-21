classdef mImgAccessor
   properties
      cellStrFunc
   end
   methods
      function obj = mImgAccessor(cellStrFunc)          
          obj.cellStrFunc= cellStrFunc;                        
      end 
      
	 function out = cell( obj )
        out = cell(size( obj.cellStrFunc ));
        for i = 1:numel( obj.cellStrFunc )
           out{i} = eval( obj.cellStrFunc{i} ); 
        end
      end
      
      function varargout = subsref(obj,S)
         if( isstruct(S) && isfield(S,'type') &&  (isequal(S.type, '{}') || isequal(S.type, '()')))
            if( isfield(S,'subs') &&  ismatrix(S.subs) )
                ids = S.subs{1};
                if( isscalar(ids) && ~isstr(ids) )
                    varargout = {eval( obj.cellStrFunc{ids} )};
                else
                    if( isequal( ids , ':'  ))
                        ids = 1:numel( obj.cellStrFunc );
                    end
                    varargout = cell(numel(ids),1);
                    if(isequal(S.type, '{}') )
                        varargout{1} = mImgAccessor( obj.cellStrFunc(ids) ); 
                    elseif (isequal(S.type, '()') )
                        out = cell(numel(ids),1);
                        for i = 1:numel(ids)
                            out{i} = eval( obj.cellStrFunc{ids(i)} );
                        end
                        varargout{1} = out; 
                    end
                  
                end
            else
                 varargout={[]};   
            end
         else
             varargout={[]};
         end
      end
      
      function numImg = numel( obj )
          numImg = numel(obj.cellStrFunc );
      end
      
      function n = numArgumentsFromSubscript(obj,S,indexingContext)
          n = 1;
          if( isstruct(S) && isfield(S,'type') &&  isequal(S.type, '{}'))
            if( isfield(S,'subs') &&  ismatrix(S.subs) )
                ids = S.subs{1};
                if( ~isscalar(ids))
                    n = numel(ids);
                end
            end
          end
      
      end  

      function newobj = horzcat(varargin)
         newobj = mycat(varargin(:));
      end
      
      function newobj = vertcat(varargin)
          newobj = mycat( varargin{:});
      end


     function newobj = mycat( varargin)
        
         tmpCellStrFunc = {};
          for i = 1:numel(varargin)
              if( isequal( class(varargin{i}) , 'mImgAccessor'))
                  tmpCellStrFunc = cat(1,tmpCellStrFunc , varargin{i}.cellStrFunc );
              end
          end
          newobj = mImgAccessor( tmpCellStrFunc );
         
     end
     
     
      
     
   end
end