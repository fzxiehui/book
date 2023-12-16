import cv2 as cv
import numpy as np
import os

"""
    目标: 使用模板匹配找到Bambi的脸
"""

# 将工作目录更改为该脚本所在的文件夹
os.chdir(os.path.dirname(os.path.abspath(__file__)))

bambi = cv.imread('./bambi/bambi.png', cv.IMREAD_UNCHANGED)
bambi_temp = cv.imread('./bambi/bambi_temp.png', cv.IMREAD_UNCHANGED)

# 查看原图
# cv.imshow('Bambi', bambi)
# cv.waitKey()

# 6 种模板匹配方法
# TM_CCOEFF 
# TM_CCOEFF_NORMED (上一个版本工具使用的)
# TM_CCORR 
# TM_CCORR_NORMED
# TM_SQDIFF 
# TM_SQDIFF_NORMED
result = cv.matchTemplate(bambi, # 图像
        bambi_temp, # 模板
        cv.TM_CCOEFF_NORMED # 算法
        )


# 保存图像, 匹配的中心点为 白色 即 255, 
# 写入时需要放大255倍，因为内存中是以 0.x表示
# 与图像的 0 - 255 表示法, 不一样
cv.imwrite('./bambi/bambi_result.png', result * 255)

# 查看匹配图 
cv.imshow('Result', result)
cv.waitKey()

# 计算最匹配的位置
min_val, max_val, min_loc, max_loc = cv.minMaxLoc(result)
print('最匹配的左上角:', max_loc)
print('最匹配率:', max_val)

# 获取 bambi_temp 的图像大小
bambi_temp_w = bambi_temp.shape[1]
bambi_temp_h = bambi_temp.shape[0]
# 配置左上角
top_left = max_loc
# 右下角
bottom_right = (top_left[0] + bambi_temp_w, top_left[1] + bambi_temp_h)

# 画矩形 输出为 png 文件时 color 需要填 255 否则会变成透明
cv.rectangle(bambi, top_left, bottom_right, 
        color=(20, 255, 20, 255), thickness=2, lineType=cv.LINE_4)

# 查看配置图
cv.imshow('Result Bambi', bambi)
cv.waitKey()

cv.imwrite('./bambi/bambi_done.png', bambi)
