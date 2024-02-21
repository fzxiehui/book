# Linux

## 常用快捷键

- `Tab` : 自动补全
- `Ctrl` + `L` ：清屏
- `ctrl` + `M` ：等效于回车
- `ctrl` + `C` : 中断正在当前正在执行的程序
- `ctrl` + `A` ： 移动光标到命令行首
- `ctrl` + `E` :  移动光标到命令行尾
- `ctrl` + `B` :  光标后退
- `ctrl` + `F` : 光标前进
- `Alt` + `F`  : 光标前进一个单词
- `Alt` + `B`  : 光标后退一格单词
- `ctrl` + `W` : 删除光标前的单词(Word, 不包含空格的字符串)
- `ctrl` + `Z` : 把当前进程放到后台（之后可用''fg''命令回到前台） 
- `ctrl ` + `X ctrl ` + `E` : 调出系统默认编辑器编辑当前输入的命令，退出编辑器时，命令执行

- 历史命令：
	- `ctrl ` + `P` : 上一条命令，可以一直按表示一直往前翻
	- `ctrl ` + `N` : 下一条命令
	- `ctrl ` + `R`，再按历史命令中出现过的字符串：按字符串寻找历史命令（重度推荐）

## 修改系统默认编辑器为`vi`

	```shell
	echo export EDITOR=/usr/bin/vi >> ~/.bashrc
	```

## `vim` & `neovim` 使用系统剪贴板

1. 安装`xclip`
	
	```shell
	sudo apt install xclip
	```

1. 在`init.vim`添加

	```shell
	set clipboard+=unnamedplus
	```

## 使用 `https` 访问 `github ssh`

1. 测试端口
	```shell
	# 测试超时 22
	ssh -T git@github.com
	
	# 测试 成功! 443 
	ssh -T -p 443 git@ssh.github.com
	```

1. 修改配置

	```shell
	vim ~/.ssh/config
	# 添加以下内容
	Host github.com
	Hostname ssh.github.com
	Port 443
	```

## 硬盘管理

- 硬盘总体情况

	```shell
	df
	# 文件系统           1K-块      已用      可用 已用% 挂载点
	# /dev/sda1      960302824 110104652 801343712   13% /home/hello/disk
	```

- 文件占用分析(ls)

	```shell
	# --block-size=M 以M 为统计单位
	# ls 只对文件有用,目录大小固定 4k
	ls -l --block-size=M
	# or
	ls -lh
	```

- 文件占用分析(du)

	```shell
	# 查看指定目录中各文件大小
	# -k 代表以 K 为统计单位, 可以改为 -m 统计单位 M 
	# --max-depth=1 代表递归深度为1
	du -k --max-depth=1 src/
	# or 
	# 统计大小 可以加上 -s 参数
	du -lh 
	```

## 进程

## 日志及系统信息

- 查看系统日志

	```shell
	tail -f /var/log/syslog
	```

- 系统版本信息

	```shell
	cat /etc/os-release
	```

- 查看硬件信息

	```shell
	lshw
	# or
	lspci
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
	# sudo apt-get install dsniff
	# 第一个ip是欺诈的主机, 第二个ip是要伪装的主机
	# -i 为网口
	sudo arpspoof -i enp4s0 -t 192.168.12.194 192.168.12.254
	sudo arpspoof -i enp4s0 -t 192.168.12.254 192.168.12.194
	```

## 路由

- 路由表

	```shell
	route -n
	```

- 开启路由转发

	```shell
	# 查看iptables FORWARD 默认规则
	sudo iptables -nL
	# > Chain FORWARD (policy DROP)
	# > target     prot opt source               destination
	# ...

	# 如果不是ACCEPT,打开路过许可:
	sudo iptables -P FORWARD ACCEPT

	# 查看转发使能是否打开
	sudo sysctl net.ipv4.ip_forward
	# 查看转发使能是否打开
	sudo sysctl -w net.ipv4.ip_forward=1

	# 或使用以下方法打开
	echo 1 | sudo tee /proc/sys/net/ipv4/ip_forward
	```
