function [pcmd,dev] = printopt(varargin)
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
%

%
pcmd = []; dev = [];

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

if isempty(pcmd)

    %
    pcmd = 'lpr -r';

    %
    if ispc
        def_printer = system_dependent('getdefaultprinter');
        if ~isempty(def_printer) && ~strcmp(def_printer,'FILE:')
            pcmd = ['COPY /B %s ' def_printer];
        else
            pcmd = 'COPY /B %s LPT1:'; 
        end
    end


    %
    %
    %
end

if isempty(dev)

    %
    if ispc
       dev = '-dwin'; 
    else
    %
       dev = '-dprn'; 
    end
end
