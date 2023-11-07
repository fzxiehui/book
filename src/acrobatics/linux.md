# Linux

## 进程

## 端口

- 占用查看

	```shell
	sudo netstat -anlp | grep 8080
	```

- 端口扫描

	```shell
	# nc -z -v -w 1 {ip} {start_port}-{start_port} 2>&1 | grep succeeded 
	# e.g.
	nc -z -v -w 1 192.168.1.1 9000-10000 2>&1 | grep succeeded
	```
## arp

- 本地映射表

	```shell
	arp -a
	```

- 欺诈

	:::tip 提示
	需要提前开启路由转发功能，否则目标主机会断网
	:::

	```shell
	# 第一个ip是欺诈的主机, 第二个ip是要伪装的主机
	arpspoof -i eth1 -t 192.168.12.194 192.168.12.254
	arpspoof -i eth1 -t 192.168.12.254 192.168.12.194
	```

## 路由

- 路由表

	```shell
	route -n
	```

- 开启路由转发

	```shell
	echo 1 | sudo tee /proc/sys/net/ipv4/ip_forward
	```
