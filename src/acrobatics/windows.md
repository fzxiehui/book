# Windows

## 服务注册(nssm)


在`Linux`系统中`systemctl`用于托管服务非常方便，在`Windows`中服务注册可以通过系统自带的`sc`指令添加，
不过要求运行的应用需要符合`Windows`服务相关标准,不过可以通过`nssm`等软件作为服务外壳，以减少跨平台调试成本。

### 快速使用

- 下载安装

	- 官网: https://www.nssm.cc
	- 下载地址: https://www.nssm.cc/ci/nssm-2.24-101-g897c7ad.zip

- 使用

	1. 解压文件
	1. 请以管理员身份运行`cmd`或`PowerShell`并进入`win32`或`win64`目录。
	1. 在`cmd`中输入 `.\nssm.exe install`, 即可弹出以下图形界面, 其中`Path`为软件绝对路径,
		`Startup directory` 为工作目录, `Arguments` 为运行参数。
	
		![nssm install](../assets/images/windows/install.png)

- 示例
	1. 示例介绍: `thumper`示例软件运行时需要`thumper.exe`与`config.yaml`,即一个运行时使用的`exe`
		可以执行文件，一个`yaml`配置文件, 在命令行模式中`thumper`示例软件运行完整命令为:
		`.\thumper.exe start -c .\config.yaml`
	
	1. 配置截图
		
		![nssm eg](../assets/images/windows/nssmeg.png)
	
	1. 点击`Install service` 后, 回到 `cmd`或`PowerShell` 输入下方指令出现**操作成功完成**, 说明成功。

		```shell
		PS C:\ ... \win64> .\nssm.exe start th
		th: START: 操作成功完成。
		```
	
	1. 也可以通`services.msc`查看服务状态。

	1. 通过以上方法注册的服务,特点说明:

		- 具有开机自启功能。
		- 具有失败自动重启功能并且没有延时，对于启动加载内容比较多的服务，建议添加重启延时。
