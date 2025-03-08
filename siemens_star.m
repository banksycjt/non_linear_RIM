% 创建图像尺寸
width = 512;
height = 512;

% 生成坐标网格
[x, y] = meshgrid((0:width-1) - (width-1)/2.0, (height-1)/2.0 - (0:height-1)');

% 计算极角（角度制）
theta = atan2d(y, x);
theta = mod(theta + 360, 360);  % 转换为0-360度

% 计算扇形区域（48个辐条）
num_spokes = 48;
sector_size = 360 / num_spokes;
sectors = floor(theta / sector_size);

% 创建二值图像（偶数为黑，奇数为白）
image_array = uint8(mod(sectors, 2) * 255);

% 创建并保存图像
imwrite(image_array, 'siemens_star.tif');

disp('西门子星靶图像已生成：siemens_star.tif');