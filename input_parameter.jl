using ImageFiltering

# 定义高斯核的标准差
sigma = 4.0

# 生成高斯模糊核
gaussian_kernel = Kernel.gaussian((sigma, sigma))  # 生成 2D 高斯核

# 显示高斯核的大小和值
println("高斯核的大小: ", size(gaussian_kernel))
println("高斯核的值: ")
display(gaussian_kernel)

# 将高斯核保存为图像（可选）
using Images
save("gaussian_kernel.tif", Gray.(gaussian_kernel))