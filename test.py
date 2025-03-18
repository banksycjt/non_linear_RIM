from PIL import Image
import numpy as np

# 定义颜色判断函数
def is_white(pixel, threshold=200):
    """判断像素是否为白色"""
    r, g, b = pixel
    return r > threshold and g > threshold and b > threshold

def is_light_green(pixel):
    """判断像素是否为浅绿色"""
    r, g, b = pixel
    return g > r and g > b and g > 150 and r < 200 and b < 200  # 浅绿色的绿色通道值较高，但不接近白色

def is_black(pixel, threshold=120):
    """判断像素是否为黑色"""
    r, g, b = pixel
    return r < threshold and g < threshold and b < threshold

def is_purple(pixel):
    """判断像素是否为紫色"""
    r, g, b = pixel
    return r > g and b > g and r > 100 and b > 100  # 紫色的红色和蓝色通道值较高，且绿色通道值较低

def is_brown_green(pixel):
    """判断像素是否为棕绿色"""
    r, g, b = pixel
    return r > 100 and g > 100 and b < 100 and r > g  # 棕绿色的红色和绿色通道值较高，但红色略高于绿色

def is_red(pixel):
    """判断像素是否为红色"""
    r, g, b = pixel
    return r > g and r > b and r > 150  # 红色的红色通道值较高

def is_blue(pixel):
    """判断像素是否为蓝色"""
    r, g, b = pixel
    return b > r and b > g and b > 150  # 蓝色的蓝色通道值较高

def filter_image(input_path, output_path):
    """处理图片，保留白色、浅绿色、黑色和紫色像素，剔除其他颜色并替换为白色"""
    # 打开图片
    image = Image.open(input_path)
    image = image.convert("RGBA")  # 确保图片有透明度通道
    pixels = np.array(image)  # 将图片转换为 numpy 数组

    # 遍历每个像素
    for i in range(pixels.shape[0]):
        for j in range(pixels.shape[1]):
            pixel = pixels[i, j, :3]  # 获取 RGB 值
            if (not (is_white(pixel) or is_light_green(pixel) or is_black(pixel) or is_purple(pixel))) or (is_brown_green(pixel)):
                pixels[i, j, :3] = [255, 255, 255]  # 将不符合的颜色替换为白色

    # 将 numpy 数组转换回图片
    result_image = Image.fromarray(pixels)
    result_image.save(output_path)  # 保存处理后的图片

# 使用示例
input_path = "input.png"  # 输入图片路径
output_path = "output.png"  # 输出图片路径
filter_image(input_path, output_path)