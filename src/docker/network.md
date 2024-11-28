# Docker 网络

:::tip 网络驱动简介
- bridge - 桥接到主机, 自定义``bridge``可以自动添加容器间``dns``解析。
- host - 主机模式,相当于与把应用直接跑在主机上,并且不能配置端口映射。
- null - 没有网络
:::

- 自定义``bridge``互通测试

	1. 创建``demo2.yml``文件并写入以下内容:

		<<< @/src/code/docker-compose/demo2.yml

	1. 启动容器``docker-compose -f demo2.yml up -d``
	1. 通过``docker exec -it demo1 /bin/bash``命令,进入``demo1``容器
	1. 执行``ping demo2``,能``ping``通说明通信正常。
	1. 关闭容器``docker-compose -f demo2.yml down``

## docker-compose 固定ip

> 其中: `mynet`网络名 `ipv4_address: 192.168.1.10` 固定ip, `myapp: {}` 自动获取

```yaml{6-8,12-13,15-20}
version: '3'

services:
  web:
    image: nginx
    networks:
      mynet:
        ipv4_address: 192.168.1.10

  app:
    image: myapp
    networks:
      mynet: {}

networks:
  mynet:
    driver: bridge
    ipam:
      config:
        - subnet: 192.168.1.0/24
```

## docker 导致网络故障

> `docker`容量运行前最好定义`docker`网络，
否则`docker`会自行创建一个默认网络，
创建过多网络时就有概率与网关ip冲突，
可以通过以下命令排查修复。

```shell
# 查看网络信息
ip add
# 删除冲突接口
sudo ip link delete br-3a61dba4fa5a

# 创建网络(参考)
docker network create --driver bridge --subnet 192.168.1.0/24 --gateway 192.168.1.0 mynet
解释：
--driver bridge 表示使用桥接模式
--subnet 192.168.1.0/24 表示子网ip 可以分配 192.168.1.2 到 192.168.1.254
--gateway 192.168.1.0 表示网关
mynet 表示网络名

# 运行时指定网络 --network (参考)
docker run ** --network mynet
```
