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

try
    %
    %
    %
    %
    %
    %
    %
catch exc
    warning(message('MATLAB:matlabrc:RecursionLimit', exc.identifier, exc.message));
end

%
warning backtrace

try
    %
    warning off MATLAB:mir_warning_unrecognized_pragma
    warning off MATLAB:subscripting:noSubscriptsSpecified %

    warning off MATLAB:JavaComponentThreading
    warning off MATLAB:JavaEDTAutoDelegation

    %
    warning off MATLAB:RandStream:ReadingInactiveLegacyGeneratorState
    warning off MATLAB:RandStream:ActivatingLegacyGenerators

    warning off MATLAB:class:DynPropDuplicatesMethod
catch exc
    warning(message('MATLAB:matlabrc:DisableWarnings', exc.identifier, exc.message));
end

%
clear

%
try
if strcmpi(system_dependent('getpref','GeneralEchoOn'),'BTrue')
    echo on
end
catch exc
    warning(message('MATLAB:matlabrc:InitPreferences', exc.identifier, exc.message));
end

