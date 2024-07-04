# 硬盘相关

## 挂载

1. 创建挂载文件夹`sudo mkdir /mnt/data`
1. 挂载`sudo mount /dev/sda /mnt/data`
1. (可选)加读写权限`sudo chmod -R 777 /mnt/data`

## 自动挂载

1. 备份**fstab**文件`sudo cp /etc/fstab /etc/fstab.bak`
1. 创建挂载文件夹`sudo mkdir /mnt/data`
1. 获取设备信息`sudo blkid`

	```shell
	/dev/sda: UUID="011364fa-339f-40a6-983c-11077dfd75cb" BLOCK_SIZE="4096" TYPE="ext4"
	```
1. 谨慎添加新条目`sudo vi /etc/fstab`

	```shell{13}
	# /etc/fstab: static file system information.
	#
	# Use 'blkid' to print the universally unique identifier for a
	# device; this may be used with UUID= as a more robust way to name devices
	# that works even if disks are added and removed. See fstab(5).
	#
	# <file system> <mount point>   <type>  <options>       <dump>  <pass>
	# / was on /dev/nvme0n1p2 during curtin installation
	/dev/disk/by-uuid/1cbe3c68-8d83-40f8-9568-b2f902cf5371 / ext4 defaults 0 1
	# /boot/efi was on /dev/nvme0n1p1 during curtin installation
	/dev/disk/by-uuid/9EA5-BA07 /boot/efi vfat defaults 0 1
	/swap.img	none	swap	sw	0	0
	UUID=011364fa-339f-40a6-983c-11077dfd75cb /mnt/data ext4 defaults 0 0
	```

1. 测试和验证`sudo mount -a`
1. 重新加载配置文件`systemctl daemon-reload`, 一定要上测试验证无报错后执行。
1. 为了方便使用可以创建软链接`ln -s [disk] [userdir]`
