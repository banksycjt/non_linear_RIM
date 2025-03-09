clear
% 读取图像
ground_truth_image = imread('siemens_star.tif');
ground_truth_image = im2gray(ground_truth_image);
ground_truth_image = im2double(ground_truth_image); % 转换为 double 类型

% 常量定义
ground_truth_pixel_size = 0.02; % In micrometers
numerical_aperture = 1.3;
magnification = 100.0;
light_wavelength = 0.480; % In micrometers
camera_pixel_size = 6.5; % In micrometers
physical_pixel_size = camera_pixel_size / magnification; % In micrometers
abbe_diffraction_limit = light_wavelength / (2 * numerical_aperture);

% 创建一个多页的TIFF文件
tiff_filename = 'combined_images.tif';

random_illumination_image = zeros(512, 512, 800);
combined_image = uint8(zeros(512, 512));

for i = 1:80
    % speckle intensity
    random_pixel = zeros(512, 512);
    indices = randperm(512 * 512, 100000);
    random_pixel(indices) = 1.0;

    speckle_image = 255* ground_truth_image .* random_pixel;

    % psf type: gaussian
    convolved_img = imgaussfilt(speckle_image, 4);
    random_illumination_image(:, :, i) = convolved_img;
    convolved_img = uint8(convolved_img);
    fprintf("%d次开始\n",i);
    % 将图像写入多页TIFF文件
    if i == 1
        imwrite(convolved_img, tiff_filename, 'tif', 'WriteMode', 'overwrite');
    else
        imwrite(convolved_img, tiff_filename, 'tif', 'WriteMode', 'append');
    end

    % 叠加图像
    combined_image = combined_image + convolved_img;
    fprintf("%d次结束\n",i);
end

% 归一化叠加图像
    combined_image = combined_image/8;
% 保存叠加图像
imwrite(combined_image, 'average_image.tif');

disp('800张图片已生成并合并为一个TIFF文件：combined_images.tif');
disp('叠加图像已生成：average_image.tif');
