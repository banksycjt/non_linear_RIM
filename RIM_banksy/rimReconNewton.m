%% This function for RIM reconstrcution by newton's method
%% Zhengqi 20240529
function [recon,memCrit] = rimReconNewton(showImages, variance , otfs , numItMax ,  L2param, Bmod , tolCGS, initGuess  )

    %***************************************************************************
    % RIM reconstrcution by newton's method
    %***************************************************************************
    % function [recon,memCrit] = rimReconNewton(imgstack,varargin)
    %-----------------------------------------------
    %Source code for RIM reconstruction
    %SRstack    input data to be evaluated
    %varargin   configurations
    %------------------------------------------------
    %***************************Configurations***********************************
    %---------------------------images property----------------------------------
    % showImages:
    % variance: the variance of filted and noise free raw images stack
    % otfs: a imgstack of Collection otf and Excitation otf {default:512x512x2}
    % numItMax: the num of newton iteration  {default:100 ???}
    % L2param: the L2 norm {}
    % Bmod:
    % tolCGS:
    % initGuess: the initial guess vaul


    %% 参数判断
    if( nargin < 6 || isequal(Bmod, []) )
        Bmod = 0;
        numFiltPrec = numel(otfs) ;
    else
        numFiltPrec = min( Bmod, numel(otfs));
    end
    if( nargin < 7 || isequal(tolCGS, []) )
        tolCGS = 1e-3; %
    end    
    tic;
    stopbutton=0; %

    %% 初始化
	tempFilt = otfs{1};
    tempFilt = conj(tempFilt) ./ (abs(tempFilt).^2 + 1e-3 );
    tempFilt = tempFilt./ tempFilt(1); 

    if( nargin < 8 || isequal(initGuess, []) )
        initGuess = abs(ifft2( fft2( sqrt(variance) ) .* tempFilt ));
    end
    
    recon   = initGuess;
    ftRecon = fft2( initGuess ); %
    curSize = size( recon );
    memCrit = zeros(numItMax,1);    
    %
    if(showImages==1)
        %
        screenSize = get(0,'screensize');
        screenWidth = screenSize(3);
        screenHeight = screenSize(4);

        f4 = figure();
        f4.Position = [screenWidth/4 0 screenWidth/2 screenHeight];

        buttonSize = 80;
        uicontrol('style','pushbutton',...
        'callback'      ,@stop,...
        'tag'           ,'stop',...
        'string'        ,'STOP',...
        'BackgroundColor', 'red',...
        'FontSize', 20,...
        'Position'      , [100 50 buttonSize buttonSize] );
    end

    %% 图像重建及可视化
    for it = 1:numItMax

        Mrec = cellfun( @(x) (ifft2( ftRecon .* x)), otfs , 'UniformOutput', 0 ); %
        curRes = sum( abs( cat(3,Mrec{:}) ).^2 ,3) - variance; %
        memCrit(it) = sum(abs(curRes(:)).^2) + L2param*sum(abs(recon(:)).^2); %
        
        curG = g(curRes,recon); %
        
        [deltaRec,flag] = cgs(@B,-curG,tolCGS); %
        deltaRec = reshape(deltaRec,curSize); %
        recon =recon + deltaRec; %
        
        if(mean(recon(:))<0) %
            recon = -recon;
        end
        
        ftRecon = fft2(recon); %
        
        %        
        %        
        if(showImages==1)
            %
            imagesc(real(recon));
            colormap gray
            axis square       
            title({['AlgoRIM reconstruction : iteration ',num2str(it),'/',num2str(numItMax)],[' crit : ',num2str(memCrit(it))]});
            colorbar;
            drawnow;
                
            if(stopbutton==1)
                break;
            end
        end
    end  
    
    
    %
    %
    %% L2迭代    
    function y = g( x, rec )
        x = reshape( x , curSize );
        y = zeros(curSize);
        for i = 1:numel(otfs)
            y = y + ( conj(otfs{i}) .*  fft2( Mrec{i} .* x ) );
        end
        y = ifft2(y);
        y = 4*real( y(:) ) + 2*L2param*rec(:);
    end
    %
    %% 傅里叶逆变换及滤波
    function y = B( x )
        x = reshape( x , curSize );
        ftX = fft2(x);
        y = zeros(curSize);
        v = zeros(curSize);
        for i = 1:numFiltPrec
            temp = ifft2( otfs{i} .*  ftX );
            v = v + Mrec{i} .* temp;
            if( Bmod == 0 )
                y = y + 2*( conj(otfs{i}).* fft2(curRes.*temp) );
            end
        end        
        
        for i = 1:numFiltPrec
            y = y + 4*( conj(otfs{i}) .*  fft2( Mrec{i} .* v ) );
        end
        y = ifft2(y);
        y = 2*real( y(:)) + 2*L2param*x(:);
    end
    toc;   
     function stop(source,callbackdata)
        stopbutton=1;
     end    
end