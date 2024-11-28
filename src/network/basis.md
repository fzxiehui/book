# 网络基础

:::tip 提示
实验环境为`ubuntu 1804`
:::

## ip 扫描

- `nmap` 

```shell
# sudo apt install nmap
nmap -sn 192.168.12.0/24
```

- `fping` 

```shell
# sudo apt install fping
fping -a -g 192.168.12.1 192.168.12.255
```

- `arp`

> 前题条件: 已存在路由表中(有过通信)

```shell
# sudo apt install net-tools
arp -a
```

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

## 路由分析

> 在`windows`环境中使用 `tracert`代替

- `mtr`

```shell
mtr 8.8.8.8
```
