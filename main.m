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

% speckle intensity
rng(256);
random_pixel = zeros(512, 512);
indices = randperm(512 * 512, 10000);
random_pixel(indices) = 1.0;

speckle_image = ground_truth_image .* random_pixel;
imwrite(speckle_image, 'speckle_image.tif');

% psf type: gaussian
psf = fspecial('gaussian', [4 4], 4);
convolved_img = imfilter(speckle_image, psf, 'replicate');
imwrite(convolved_img, 'convolved_image.tif');