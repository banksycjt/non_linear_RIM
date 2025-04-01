import numpy as np
from PIL import Image
import matplotlib.pyplot as plt
from scipy.ndimage import convolve

# 创建图像尺寸
width = 256
height = 256

# 生成坐标网格
x = np.arange(width) - (width-1)/2.0
y = (height-1)/2.0 - np.arange(height)
x, y = np.meshgrid(x, y)

# 计算极角（角度制）
theta = np.degrees(np.arctan2(y, x))
theta = np.mod(theta + 360, 360)  # 转换为0-360度

# 计算扇形区域（48个辐条）
num_spokes = 48
sector_size = 360 / num_spokes
sectors = np.floor(theta / sector_size)

# 创建32位图像（偶数为黑，奇数为白）
image_array = np.where(np.mod(sectors, 2) == 0, 0, 4294967295).astype(np.uint32)

# 使用PIL保存32位TIFF
img = Image.fromarray(image_array)
img.save('siemens_star.tif', format='TIFF', compression='none')

print('西门子星靶图像已生成：siemens_star.tif')

