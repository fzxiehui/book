# 制作dab安装包（实验）

## 安装

```shell
sudo apt-get update
sudo apt-get install dpkg-dev debhelper
```

## 编写`Systemd`服务文件
在`debian/my-package.service`文件中定义你的`Systemd`服务。
确保在`[Install]`部分设置`WantedBy`为`multi-user.target`或其他适当的目标，以确保服务能在系统启动时启动。
示例`my-package.service`文件：

```shell
[Unit]
Description=My Package Service
After=network.target

[Service]
Type=simple
ExecStart=/usr/bin/my-package-binary
Restart=always

[Install]
WantedBy=multi-user.target
```

## 编写`debian/postinst`脚本

`debian/postinst`脚本会在软件包安装后执行。
你可以在此脚本中使用`systemctl`命令来启用并启动你的服务。

创建并编辑`debian/postinst`文件：

```shell
#!/bin/sh

set -e

# Enable and start the service on installation
if [ "$1" = "configure" ]; then
    systemctl daemon-reload
    systemctl enable my-package.service
    systemctl start my-package.service || true
fi

# systemd preset policy requires to exit with status 0
exit 0
```

在这个脚本中：
- `systemctl daemon-reload` 用于重新加载`systemd`配置，以确保新的服务文件能被识别。
- `systemctl enable my-package.service`会将服务设置为开机自启动。
- `systemctl start my-package.service`尝试启动服务。使用 `|| true` 来确保即使启动失败（例如，因为软件包尚未完全安装），也不会导致安装失败。


## 编写`debian/postrm`脚本 (可选)

如果你想在软件包被删除时禁用服务，可以创建`debian/postrm`脚本。

```shell
#!/bin/sh

set -e

# Remove the service on uninstallation
if [ "$1" = "remove" ]; then
    systemctl stop my-package.service || true
    systemctl disable my-package.service || true
fi

# systemd preset policy requires to exit with status 0
exit 0
```
这个脚本会在`my-package`被移除时停止并禁用服务。

## 更新`debian/control`文件

确保`debian/control`文件中的描述正确地反映了你的软件包的名称、版本等信息。
```shell
Source: my-package
Section: utils
Priority: optional
Maintainer: Your Name <your.email@example.com>
Build-Depends: debhelper (>= 12)
Standards-Version: 4.5.1
Homepage: http://example.com
Vcs-Git: https://github.com/your/repository.git

Package: my-package
Architecture: amd64
Depends: ${shlibs:Depends}, ${misc:Depends}
Description: Your package description
 Long description here if needed.

```
## 编写`debian/rules`文件

`debian/rules`文件定义了构建和安装过程中的具体操作。一个基本的例子如下：

```shell
#!/usr/bin/make -f

%:
	dh $@
```

## 构建和安装软件包
完成上述步骤后，可以使用`dpkg-buildpackage`命令来构建你的`Debian`包：

```shell
cd my-package
dpkg-buildpackage -us -uc
```

然后使用 dpkg -i 命令安装生成的 .deb 文件：

```shell
sudo dpkg -i my-package.deb
```

## 测试

安装完成后，使用以下命令来验证服务是否已正确设置为开机自启动并已启动：

```shell
sudo systemctl status my-package.service
```

此时，服务应该处于运行状态，并且已设置为开机自启动。
通过以上步骤，你的软件包应该能够在安装后自动设置为开机自启动并启动服务。
