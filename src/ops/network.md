# 网络

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

> 前题条件: 已存在路由表中

```shell
# sudo apt install net-tools
arp -a
```

## 路由分析

- `mtr`

```shell
mtr 8.8.8.8
```
