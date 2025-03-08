using TiffImages
using Images
using Random

ground_truth_image = load("siemens_star.tif")
ground_truth_image = Gray.(ground_truth_image)

const ground_truth_pixel_size = 0.02# In micrometers
const numerical_aperture::Float64 = 1.3
const magnification::Float64 = 100.0
const light_wavelength::Float64 = 0.480# In micrometers
const camera_pixel_size::Float64 = 6.5 # In micrometers
const physical_pixel_size::Float64 = camera_pixel_size/magnification #in micrometers
const abbe_diffraction_limit::Float64 = light_wavelength/(2*numerical_aperture)

# speckle intensity

Random.seed!(256)
random_pixel = zeros(Gray{N0f8}, 512, 512)
indices = rand(1:512*512, 100000)
random_pixel[indices] .= 1.0

speckle_image = ground_truth_image.*random_pixel
save("result_image.tif", speckle_image)

# psf type: gaussian

psf = load("psf.tif") 
psf = Gray.(psf)
convolved_img = imfilter(speckle_image, Kernel.gaussian(4), Fill(0))  # Fill(0) 表示边界填充为 0
save("convolved_image.tif", convolved_img)