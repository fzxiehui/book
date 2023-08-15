# nginx

nginx 可以做什么? @TODO

## 安装

:::tip 提示
测试环境: ``ubuntu 1804``

如果使用的是``root``用户,无需加``sudo``
:::

- 使用``apt``安装

```shell
$ sudo apt update
$ sudo apt install nginx
```

## 常用命令

1. 服务

	- 重启: ``sudo systemctl restart nginx.service``

2. 日志

	- 查看日志: ``sudo tail -f /var/log/nginx/access.log`` 
	- 查看错误: ``sudo tail -f /var/log/nginx/error.log``


## 配置文件

1. ``/etc/nginx/sites-enabled/default`` 配置文件中定义默认使用``80``端口, 如果需要使用``80``端口. 需要修改``default``文件。

	::: details 点击查看完整配置文件
	<<< @/src/code/nginx/default{22,23}
	::: 

1. ``/etc/nginx/nginx.conf`` 配置文件中定义了``nginx``部分默认配置.

	- 部署前端应用时可能出现**无访问权限问题**，可以确认``nginx.conf``文件中的 ``user`` 与当前系统用户是否一致，``nginx`` 默认为 ``wwww-data``.

	::: details 点击查看完整配置文件
	<<< @/src/code/nginx/nginx.conf{1}
	::: 

	- 如需支持``Web Socket``可以在``nginx.conf``中加入``协议升级配置``.

	::: details 点击查看完整配置文件
	<<< @/src/code/nginx/nginx.conf_websocket{23-27}
	::: 

1. 用户所有配置应放``/etc/nginx/conf.d/``目录下，而不是直接修改``nginx.conf``。

	- 常规项目配置实例: ``/etc/nginx/conf.d/app.conf``

	::: details 点击查看完整配置文件
	<<< @/src/code/nginx/app.conf
	::: 

	- 包含 ``emqx web socket`` 的应用配置.

	::: details 点击查看完整配置文件
	<<< @/src/code/nginx/emqxapp.conf
	::: 
