% 定义正弦波函数
f = @(x) sin(x);

% 计算从 x1 到 x2 的定积分
x1 = 0;
x2 = pi;
area = integral(f, x1, x2);

% 显示结果
disp(area);