%% 初始化
	tempFilt = otfs{1};
    tempFilt = conj(tempFilt) ./ (abs(tempFilt).^2 + 1e-3 );
    tempFilt = tempFilt./ tempFilt(1); 

    % if( nargin < 8 || isequal(initGuess, []) )
        initGuess = abs(ifft2( fft2( sqrt(variance) ) .* tempFilt ));
    % end
    
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
        
        curG = g(curRes,recon,curSize); %
        
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
    %
    %% L2迭代    
    function y = g( x, rec, curSize,otfs )
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
        curSize = [512,512];
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
    % toc;   
     function stop(source,callbackdata)
        stopbutton=1;
     end    