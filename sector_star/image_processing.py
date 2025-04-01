import numpy as np
from PIL import Image
import matplotlib.pyplot as plt
from scipy.ndimage import convolve

width = 256
height = 256

# 生成256x256的随机散斑图片
# speckle_image = np.zeros((height, width), dtype=np.uint32)
speckle_image = np.zeros((height, width))
num_speckles = 1000
indices = np.random.choice(height * width, num_speckles, replace=False)
speckle_image[np.unravel_index(indices, (height, width))] = 1

plt.imshow(speckle_image, cmap='gray')
plt.axis('off')  # 不显示坐标轴
plt.show()

# 加载 PSF 图像
psf_image = Image.open('PSF256_405nm.tif')
psf_array = np.array(psf_image)

# 对散斑图片进行卷积，使用模式'constant'并设置cval=0.0以减少内存使用
convolved_image = convolve(speckle_image, psf_array, mode='constant', cval=0.0)

# 显示卷积后的图像
plt.imshow(psf_array, cmap='gray')
plt.axis('off')  # 不显示坐标轴
plt.show()