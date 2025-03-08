import numpy as np
from PIL import Image

# 创建图像尺寸
width, height = 512, 512

# 生成坐标网格
x = np.arange(width) - (width - 1)/2.0  # 中心对齐
y = (height - 1)/2.0 - np.arange(height)[:, np.newaxis]

# 计算极角（角度制）
theta = np.degrees(np.arctan2(y, x))
theta = (theta + 360) % 360  # 转换为0-360度

# 计算扇形区域（32个辐条）
num_spokes = 48
sector_size = 360 / num_spokes
sectors = np.floor(theta / sector_size).astype(int)

# 创建二值图像（偶数为黑，奇数为白）
image_array = np.where(sectors % 2 == 0, 0, 255).astype(np.uint8)

# 创建并保存图像
img = Image.fromarray(image_array)
img.save("siemens_star.tif", format="TIFF", compression=None)

print("西门子星靶图像已生成：siemens_star.tif")