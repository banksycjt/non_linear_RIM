%
function [wienerParam] = adjustWiener(app,img,varPathPsfEmission,varFilePsfEmission,varExpFactorPSFFieldValue, wienerParam )
                   
%
%

    curSize = size(img{1});

    %
    [ otfCol ] = psfToOtf(varPathPsfEmission,varFilePsfEmission,varExpFactorPSFFieldValue,curSize);
    
    %
    screenSize = get(0,'screensize');
    screenWidth = screenSize(3);
    %
    
    h = figure();
    h.WindowState = 'maximized';
    set(h,'Name', 'Wiener param setting');
    drawnow();

    %

    %
    uicontrol('Style', 'slider','Min',0,'Max',1,'SliderStep',[0.001 0.001],'Value',wienerParam,'Position', [(screenWidth/2)-100 100 200 20],'Callback', @setWienerParam); 

    %
    txtLogOffset = uicontrol('Style','text','Position',[(screenWidth/2)-100 80 200 20],'String',strcat('Wiener parameter = ',num2str(wienerParam)));
    
    %
    uicontrol('style','pushbutton',...
        'callback'      ,@OK,...
        'tag'           ,'OK',...
        'string'        ,'OK',...
        'Position'      , [(screenWidth/2)-20 40 40 40] );

    
    isWienerParamSet = 0;
    %
    subplot(2,2,1);
    curImg = real(img{1});
    imagesc(curImg);
    title('One raw speckle image');
    colorbar;
    colormap gray;
    axis square;
    
    hold on
    x1 = [size(curImg,1)/2 size(curImg,1)/2];
    y1 = [0 size(curImg,2)];
    plot(x1,y1,'r');
    hold off
    
    
    subplot(2,2,3);
    c1 = improfile(curImg,x1,y1);
    plot(c1(:,1,1),'r');
    title('Intensity profile');
    xlabel('Distance along profile');
    axis square;
    axis ([0 size(curImg,2) 0 max(c1)]); %


    while(isWienerParamSet==0)
        wienerFilter = conj(otfCol)./(abs(otfCol).^2 + wienerParam );            
        decImg = ifft2( fft2(curImg).* wienerFilter );
        %
        subplot 222
        imagesc(real(decImg));
        title('Deconvolved image');
        colorbar;
        colormap gray;
        axis square;
        
       hold on
        x2 = [size(curImg,1)/2 size(curImg,1)/2];
        y2 = [0 size(curImg,2)];
        c2 = improfile(real(decImg),x2,y2);

        plot(x2,y2,'r');    
        hold off
        
        subplot(2,2,4);
        plot(c2(:,1,1),'r');
        title('Intensity profile');
        xlabel('Distance along profile');
        axis square;
        axis ([0 size(curImg,2) 0 max(c1)]); %

    
        drawnow;
        %

        if ishandle(h) == 0
            isWienerParamSet = 1;
        end
    end
    close;
    drawnow;
    
    function setWienerParam(source,callbackdata)
%
%
        wienerParam = 0.001 + source.Value;
        txtLogOffset.String = strcat('Wiener parameter = ',num2str(wienerParam));
    end


    function OK(source,callbackdata)
        isWienerParamSet = 1;
    end
end

