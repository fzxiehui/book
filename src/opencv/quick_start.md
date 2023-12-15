# 快速开始

## 虚拟环境及安装

- 虚拟环境

	```shell
	# 创建虚拟环境
	virtualenv venv
	# 激活虚拟环境
	source venv/bin/activate
	```

- 安装库

	```shell
	pip install opencv-python
	```


## Bambi 模板匹配

- 准备`bambi_temp.png` 与 `bambi.png `图像并放在 `./bambi` 目录中

	| bambi_temp.png        | bambi.png |
	| :-------------: |:-------------:|
	| ![bambi](../assets/images/opencv/bambi/bambi_temp.png) | ![bambi](../assets/images/opencv/bambi/bambi.png) |

- 运行代码后生成以下图像

	| 匹配示意 | 框选匹配区域 |
	| ------------- |:-------------:|
	| ![bambi](../assets/images/opencv/bambi/bambi_result.png) | ![bambi](../assets/images/opencv/bambi/bambi_done.png) |

- 代码

	<<< @/src/code/opencv/bambi/demo1.py
