
function [ otfs, S] = simFiltersVariance( otfCol, otfIllu, k)
    % SIMFILTERSVARIANCE 使用结构光照显微镜（SIM）原理模拟具有方差的滤波器。
    %   [otfs, S] = simFiltersVariance(otfCol, otfIllu, k) 使用SIM原理模拟
    %   捕捉光学系统变化的滤波器。
    %
    %   参数:
    %   - otfCol: 收集系统的光学传递函数。
    %   - otfIllu: 照明系统的光学传递函数。
    %   - k: 要模拟的滤波器数量。
    %
    %   返回:
    %   - otfs: 存储在单元中的模拟滤波器集。
    %   - S: 对角矩阵，包含特征值。

    % 初始化
    curSize  = size(otfCol);                     % otfCol矩阵的大小
    n = prod(curSize);                           % otfCol中元素的总数
    psf = ifftn(otfCol);                         % 点扩散函数
    [U,S] = eigs(@(x) testMultSigma(x),n,k );
    
    % 特征值分解
    U = U*sqrt(S);                               % 归一化特征向量
    S = diag(S);                                 % 将特征值提取到对角矩阵中
    otfs = fft2( reshape( U, [curSize k]   ));   % 2D傅立叶变换得到otf
    otfs = num2cell(otfs,[1 2]); %               % 将每个otf滤波器存储在单元中
 
    % 嵌套函数: testMultSigma
    function z = testMultSigma(x)
        % 执行涉及psf、otfIllu和傅立叶变换的操作
        z = reshape(x,curSize); %
        z = psf.*z; %
        z = ifftn( fftn(z).*otfIllu); %
        z = psf.*z; %
        z = real(z(:));        
    end
    

end

