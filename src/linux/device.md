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

	> 以下两种方式都是创建或修改`/etc/asound.conf`文件, 通过`sudo alsa force-reload`命令或重启设备生效

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

## 音频播放与音量调节

- 音量调节

	可使用`alsamixer`, `F6`选择设备后进行**音量调节**

- 使用默认输出设备播放音频

	```shell
	aplay test.wav
	```

- 使用指定设备播放音频

	> 命令: 列出设备`aplay -l` 播放`aplay -D plughw:1,0 test.wav`

	```shell
	# 列出音频输出设备
	aplay -l
	# output:
	**** List of PLAYBACK Hardware Devices ****
	card 0: rockchiphdmi [rockchip,hdmi], device 0: fe400000.i2s-i2s-hifi i2s-hifi-0 [fe400000.i2s-i2s-hifi i2s-hifi-0]
		Subdevices: 1/1
		Subdevice #0: subdevice #0
	card 1: rockchiprk809co [rockchip,rk809-codec], device 0: fe410000.i2s-rk817-hifi rk817-hifi-0 [fe410000.i2s-rk817-hifi rk817-hifi-0]
		Subdevices: 1/1
		Subdevice #0: subdevice #0
	
	# 使用 card 1 , device 0 播放音频
	aplay -D plughw:1,0 test.wav
	```

