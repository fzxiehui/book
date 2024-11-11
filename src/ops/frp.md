# frp 内网穿穿透

## 下载

- [github](https://github.com/fatedier/frp)
- [v0.61.0](https://github.com/fatedier/frp/releases/tag/v0.61.0)
- v0.61.0 linux amd64 
	
	```shell
	cd ~
	wget https://github.com/fatedier/frp/releases/download/v0.61.0/frp_0.61.0_linux_amd64.tar.gz
	tar vxf frp_0.61.0_linux_amd64.tar.gz
	```

- v0.61.0 linux arm64
	
	```shell
	cd ~
	wget https://github.com/fatedier/frp/releases/download/v0.61.0/frp_0.61.0_linux_arm64.tar.gz
	tar vxf frp_0.61.0_linux_arm64.tar.gz
	```

## systemctl

- server `cat /etc/systemd/system/frp.service`

	```ini
	[Unit]
	Description = frp server
	After = network.target syslog.target
	Wants = network.target

	[Service]
	Type = simple
	ExecStart = /root/frp/frps -c /root/frp/frps.toml

	[Install]
	WantedBy = multi-user.target
	```

- client `cat /etc/systemd/system/frp.service`


	```ini
	[Unit]
	Description = frp client
	After = network.target syslog.target
	Wants = network.target

	[Service]
	Type = simple
	ExecStart = /home/hello/frp/frpc -c /home/hello/frp/frpc.toml

	[Install]
	WantedBy = multi-user.target
	```

## 配置

- client

	```ini
	serverAddr = "27.155.79.224"
	serverPort = 7000
	auth.token = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"

	[[proxies]]
	name = "name"
	type = "tcp"
	localIP = "127.0.0.1"
	localPort = 22
	remotePort = 700x
	```

- server

	```ini
	bindPort = 7000
	auth.token = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
	```


