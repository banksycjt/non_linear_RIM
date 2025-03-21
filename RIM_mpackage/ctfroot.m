function root=ctfroot
%
%
%
%
%
%
%

allroots = which(mfilename, '-all');
pathstr = fullfile('toolbox','compiler');
for i=1:length(allroots)
    root=fileparts(allroots{i});
    index = strfind(root, pathstr);
    root=root(1:index(end)-2);
    if(length(root) > 0) break;
    end
end
if(length(root) < 0)
    error(message('Compiler:ctfroot:UndefinedCTFRootFunction',...
        fullfile('toolbox','compiler')));
end
