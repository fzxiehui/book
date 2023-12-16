import cv2 as cv
import numpy as np
import os

"""
    目标: 使用模板匹配找到农场内全部包菜
"""

# 将工作目录更改为该脚本所在的文件夹
os.chdir(os.path.dirname(os.path.abspath(__file__)))

farm = cv.imread('./match_multiple/albion_farm.jpg', cv.IMREAD_UNCHANGED)
cabbage = cv.imread('./match_multiple/albion_cabbage.jpg', cv.IMREAD_UNCHANGED)

# 查看原图
cv.imshow('Farm', farm)
cv.waitKey()

# 6 种模板匹配方法
# TM_CCOEFF 
# TM_CCOEFF_NORMED (上一个版本工具使用的)
# TM_CCORR 
# TM_CCORR_NORMED
# TM_SQDIFF 
# TM_SQDIFF_NORMED
result = cv.matchTemplate(farm, # 图像
        cabbage, # 模板
        cv.TM_CCOEFF_NORMED # 算法
        )

threshold = 0.46


# np.where 返回值:
# (array([482, 483, 483, 483, 484]), array([514, 513, 514, 515, 514]))
loc = np.where(result >= threshold)
print(loc)

# 获取 模板宽高
# 如果是以cv.IMREAD_GRAYSCALE 灰度打开的图像，可以用[::-1] 获取宽高
# w, h = cabbage.shape[::-1]
# 获取 模板宽高cv.IMREAD_UNCHANGED
w = cabbage.shape[1]
h = cabbage.shape[0]

for pt in zip(*loc[::-1]):
    cv.rectangle(farm, pt, (pt[0] + w, pt[1] + h), (0,0,255), 2)

# 查看效果
cv.imshow('Farm', farm)
cv.waitKey()
cv.imwrite('./match_multiple/result.png', farm)
