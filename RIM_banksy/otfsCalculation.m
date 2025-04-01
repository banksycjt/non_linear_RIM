function [otfs,otfCol,otfIllu,preFilt ] = otfsCalculation(varPathPsfEmission, varFilePsfEmission,varExpFactorPSFFieldValue,curSize,varPathPsfExcitation,varFilePsfExcitation,varWienerParamFieldValue,numFilt)
        
%% PSF collection
[ otfCol ] = psfToOtf(varPathPsfEmission,varFilePsfEmission,varExpFactorPSFFieldValue,curSize);
%% PSF excitation
[ otfIllu ] = psfToOtf(varPathPsfExcitation,varFilePsfExcitation,varExpFactorPSFFieldValue,curSize);

%% OTFCOL et OTFILLU
% otfs calculation on the first image, not at every iteration
otfCol   = real( otfCol ); % Real OTF when there is no aberration: should it be left?
otfIllu  = real( otfIllu );

% Normalisations
otfCol  = otfCol  ./ otfCol(1); % OTF collection: represents the way in which the microscope transforms the image
otfIllu = otfIllu ./ mean(otfIllu(:)); % OTF excitation: represents a speckle statistic

%% PreFilt :
% As we move into frequency space, we attenuate high frequencies.
% OTF 2D: has the shape of a Chinese hat: low frequencies (at the top of the hat) are not attenuated and high frequencies (at the edge of the hat) are highly attenuated. The further away from the low frequencies, the more attenuated the signal.

% preFilt tries to rebalance high frequencies to low frequencies to compensate for this attenuation. Caution: this can increase noise.
% The larger the PreFilt, the more the high frequencies are attenuated.
% The smaller the PreFilt, the more the high frequencies are rebalanced in relation to the low frequencies (caution: noise can be accentuated too!). You need to find the right balance)

preFilt = conj(otfCol) ./ ( abs(otfCol).^2 + varWienerParamFieldValue );

% Normalisation
preFilt = preFilt ./ preFilt(1);

%% OTFS
% OTFS: This is a cell array containing the filters. If we have the same OTFcol and OTFillu, we can calculate the filters only once.
% These filters are then used to calculate the approximate statistical variance (faster than calculating the statistical variance).
% otfs calculation doesn't seem to be possible on the GPU side

otfs = simFiltersVariance( preFilt.*otfCol, otfIllu , numFilt );
            
