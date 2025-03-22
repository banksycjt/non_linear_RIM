% This script processes a ground truth image by applying random speckle patterns,
% convolves the image with a Gaussian filter, and saves the results as a multi-page TIFF file.
% Additionally, it creates an averaged image from the processed images.

clear
clc

% 读取图像
ground_truth_image = imread('siemens_star.tif');
ground_truth_image = im2gray(ground_truth_image);
ground_truth_image = im2uint8(ground_truth_image); % 转换为 double 类型

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

random_illumination_image = zeros(256, 256, 80);
combined_image = zeros(256, 256, "uint32");

for i = 1:800
    % speckle intensity
    random_pixel = zeros(256, 256, "uint32");
    indices = randperm(256, 256, 10000);
    random_pixel(indices) = 1;

    speckle_image = 255 * ground_truth_image .* random_pixel;

    % psf type: gaussian
    % 读取卷积核图像
    kernel_image = imread('kernel_image.tif');
    kernel_image = im2double(kernel_image); % 确保卷积核图像为 double 类型

    % 调整 speckle_image 尺寸以匹配 kernel_image
    speckle_image_resized = imresize(speckle_image, [256, 256]);

    % 进行卷积操作
    convolved_img = conv2(speckle_image_resized, kernel_image, 'same');

    % 调整卷积结果尺寸以匹配原始图像尺寸
    convolved_img = imresize(convolved_img, [512, 512]);

    random_illumination_image(:, :, i) = convolved_img;
    fprintf("%d次开始\n", i);
    % 将图像写入多页TIFF文件
    
    if i == 1
        imwrite(convolved_img, tiff_filename, 'tif', 'WriteMode', 'overwrite');
    else
        imwrite(convolved_img, tiff_filename, 'tif', 'WriteMode', 'append');
    end
    
    % 叠加图像
    combined_image = combined_image + uint32(convolved_img);
    fprintf("%d次结束\n", i);
end

% 归一化叠加图像
combined_image = uint8(combined_image / 80);
% 保存叠加图像
imwrite(combined_image, 'average_image.tif');

disp('800张图片已生成并合并为一个TIFF文件：combined_images.tif');
disp('叠加图像已生成：average_image.tif');
