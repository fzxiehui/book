# ubuntu个性设置

## 五笔输入法安装

```shell
$ sudo apt-get install fcitx fcitx-table-wbpy
```

## 改键

:::danger 注意
- 配置文件在``/usr/share/X11/xkb/keycodes/evdev``
- 重启后生效
:::

1. 以下配置将``Caps_Lock``键映射为``ESC``键

	```shell
	#<CAPS> = 66;
	<CAPS> = 9;
	#<ESC> = 9;
	<ESC> = 66;
	```

## 添加快捷指令

:::tip 提示
``source ~/.bashrc``生效配置
:::

1. 将``vi``,``vim``都指向``nvim``,打开``~/.bashrc``,添加以下内容

	```shell
	alias vi='nvim'
	alias vim='nvim'
	```

1. 添加代理快捷指令

	```shell
	alias proxy='export http_proxy=http://172.16.1.253:7890; export https_proxy=http://172.16.1.253:7890; export all_proxy=socks5://172.16.1.253:7890'
	```

1. 取消代理快捷指令

	```shell
	alias unproxy='unset http_proxy; unset https_proxy; unset all_proxy'
	```

	
