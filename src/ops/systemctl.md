# systemctl

systemctl 可以做什么? @TODO

:::danger 重要
配置文件目录``/etc/systemd/system/``
配置文件名``xxx.service``
:::

## 命令
```shell
# 启动服务
sudo systemctl start 服务名称

# 关闭服务
sudo systemctl stop 服务名称

# 查看服务状态
systemctl status 服务名称

# 启用服务(开机自启动)
sudo systemctl enable 服务名称

# 禁用服务(停业开机自启动)
sudo systemctl disable 服务名称

# 查看日志
journalctl -u 服务名称.service -f

# 重新加载配置文件 
sudo systemctl daemon-reload
```

## 配置模板

```shell
[Unit]
Description= 自定义可以有的空格
After= 依赖与哪个服务,一般填network.target在网络正常时开启

[Service]
Type= 一般填simple 会通过ExecStart指令来执行， \
				forking会fork一个子进程来运行，父进程会立即退出, \
				如果使用forking 最好配合PIDFile使用, 这样可以对其进行重启、停止等操作

User= 运行的用户一般为 nobody, 不过如果涉及到一些用户权限相关的事件 \
				如,操作串口等行为，最好写明是哪个用户,否则会出现权限问题。

Restart= 重启策略一般设置为on-failure, on-failure 代表当进程以非0形式退出时重启
					always 总是重启, 会出现资源占用问题。
					on-success 当软件正常退出(以0退出)时重启。
RestartSec= 服务重启间隔, 一般设置 5s， 单位缺省时以默认为秒
ExecStart= 启动指令, 最好使用绝对路径
LimitNOFILE= 打开文件描述符限制个数 1048576

[Install]
WantedBy= 启动目标一般填 multi-user.target
```

### 案例

1. ``frp``内网穿透。

	- 服务器

	::: details 点击查看完整配置文件
	<<< @/src/code/systemctl/frps.service
	:::

	- 客户端

	::: details 点击查看完整配置文件
	<<< @/src/code/systemctl/frpc.service
	:::
