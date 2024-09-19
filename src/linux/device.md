# 设备操作

## 设置默认音频输出

- 安装

	```shell
	apt install alsa-base
	```

- 通过`aplay -l`命令查看音频设备

	> 其中需要关注的信息为`card`与`device`

	```shell
	**** List of PLAYBACK Hardware Devices ****
	card 0: rockchiphdmi [rockchip,hdmi], device 0: fe400000.i2s-i2s-hifi i2s-hifi-0 [fe400000.i2s-i2s-hifi i2s-hifi-0]
		Subdevices: 1/1
		Subdevice #0: subdevice #0
	card 1: rockchiprk809co [rockchip,rk809-codec], device 0: fe410000.i2s-rk817-hifi rk817-hifi-0 [fe410000.i2s-rk817-hifi rk817-hifi-0]
		Subdevices: 1/1
		Subdevice #0: subdevice #0
	```

- 设置默认输出

	> 以下两种方式都是创建或修改`/etc/asound.conf`文件

	- 方式一(**不推荐**): 无法被多个进线程同时使用

		> `card 1` 代表使用 `rockchiprk809co`, `device 0` 表示使用`rockchiprk809co`的`0`号设备

		```shell
		defaults.pcm.card 1
		defaults.pcm.device 0
		defaults.ctl.card 0
		```
	
	- 方式二(**推荐**)：可被多个进线程同时使用

		> 其中`pcm "hw:1,0"`代表使用`card 1`的`0`号设备

		```shell{10}
		pcm.!default {
				type plug
				slave.pcm "dmixer"
		}

		pcm.dmixer {
				type dmix
				ipc_key 1024
				slave {
						pcm "hw:1,0"
						period_time 0
						period_size 1024
						buffer_size 4096
						rate 44100
				}
				bindings {
						0 0
						1 1
				}
		}
		```
