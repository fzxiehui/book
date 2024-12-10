# Pillow

## 安装

```shell
pip install pillow
```

## 转换

```python
from PIL import Image
image_path = "./test.png"
# 打开图像
img = Image.open(image_path)

# 检查是否存在 Alpha 通道
if img.mode in ("RGBA", "LA"):  # 包含 Alpha 通道的模式
		img = img.convert("RGB")  # 转换为 RGB 模式

"""
RGBA：带 Alpha 通道的彩色图像。
LA：带 Alpha 通道的灰度图像。
RGB：不带 Alpha 通道的彩色图像。
L：灰度图像。
"""
```

## 使用示例

```python 
from PIL import Image, ImageDraw, ImageFont

img = Image.open("./test.png")

# 从二进制数据中读取
# from PIL import Image
# import io
# img = Image.open(io.BytesIO(buffer))

print("format: ", img.format)
print("size", img.size)
print("mode", img.mode)
# > format:  PNG
# > size (736, 736)
# > mode RGBA
img.show() # 会使用系统图像查看工作进行显示


# 复制矩形
region = img.crop(box=(100, 100, 400, 400))

# 保存截取的图像
region.save("./region.png", "PNG")

# 把region粘贴到img, 开始位置为200,200
img.paste(region, box=(200, 200))

img.show() 

# 旋转 90度
img.rotate(45)

# 获取 rgba
r, g, b, a = img.getpixel((500, 500))
print(r, g, b, a)

drwa = ImageDraw.Draw(img)
for x in range(100):
    for y in range(100):
        drwa.point((x, y), fill=(244, 244, 244, 255))

# 文字输出
font = ImageFont.truetype("/usr/share/fonts/truetype/freefont/FreeMono.ttf", 36)
drwa.text((200, 200), ("A"), font=font, fill=(255,255,255))


img.show()
```
