# Pillow、OpenCV 转换

## 安装

```shell
pip install pillow
pip install opencv-python
```

## 示例

```python
from PIL import Image
import cv2
import numpy as np

# RGB 转换版本
def pil_to_cv_rgb(image_pil):
    """
    将 Pillow 的 RGB 图像快速转换为 OpenCV 格式 (RGB -> BGR)
    :param image_pil: Pillow 图像对象
    :return: OpenCV 图像（NumPy 数组，BGR 格式）
    """
    image_np = np.asarray(image_pil)
    if image_np.ndim == 3 and image_np.shape[2] == 3:  # RGB 图像
        return image_np[..., ::-1]  # RGB -> BGR
    return image_np  # 灰度图像直接返回

def cv_to_pil_rgb(image_cv):
    """
    将 OpenCV 的 BGR 图像快速转换为 Pillow 格式 (BGR -> RGB)
    :param image_cv: OpenCV 图像（NumPy 数组，BGR 格式）
    :return: Pillow 图像对象
    """
    if image_cv.ndim == 3 and image_cv.shape[2] == 3:  # BGR 图像
        return Image.fromarray(image_cv[..., ::-1])  # BGR -> RGB
    return Image.fromarray(image_cv)  # 灰度图像直接返回


# RGBA 转换版本
def pil_to_cv_rgba(image_pil):
    """
    将 Pillow 的 RGBA 图像快速转换为 OpenCV 格式 (RGBA -> BGRA)
    :param image_pil: Pillow 图像对象
    :return: OpenCV 图像（NumPy 数组，BGRA 格式）
    """
    image_np = np.asarray(image_pil)
    if image_np.ndim == 3 and image_np.shape[2] == 4:  # RGBA 图像
        return cv2.cvtColor(image_np, cv2.COLOR_RGBA2BGRA)  # RGBA -> BGRA
    return image_np  # 非 RGBA 图像直接返回

def cv_to_pil_rgba(image_cv):
    """
    将 OpenCV 的 BGRA 图像快速转换为 Pillow 格式 (BGRA -> RGBA)
    :param image_cv: OpenCV 图像（NumPy 数组，BGRA 格式）
    :return: Pillow 图像对象
    """
    if image_cv.ndim == 3 and image_cv.shape[2] == 4:  # BGRA 图像
        return Image.fromarray(cv2.cvtColor(image_cv, cv2.COLOR_BGRA2RGBA))  # BGRA -> RGBA
    return Image.fromarray(image_cv)  # 非 BGRA 图像直接返回


# 测试代码
if __name__ == "__main__":
    # 加载 Pillow 图像
    pil_image_rgb = Image.open("example_rgb.jpg").convert("RGB")
    pil_image_rgba = Image.open("example_rgba.png").convert("RGBA")

    # 转换 RGB 图像
    cv_image_rgb = pil_to_cv_rgb(pil_image_rgb)
    cv2.imshow("RGB Image (OpenCV)", cv_image_rgb)
    cv2.waitKey(0)
    cv2.destroyAllWindows()

    # 转换回 RGB 的 Pillow 图像
    pil_image_rgb_converted = cv_to_pil_rgb(cv_image_rgb)
    pil_image_rgb_converted.show()

    # 转换 RGBA 图像
    cv_image_rgba = pil_to_cv_rgba(pil_image_rgba)
    cv2.imshow("RGBA Image (OpenCV)", cv_image_rgba)
    cv2.waitKey(0)
    cv2.destroyAllWindows()

    # 转换回 RGBA 的 Pillow 图像
    pil_image_rgba_converted = cv_to_pil_rgba(cv_image_rgba)
    pil_image_rgba_converted.show()
```
