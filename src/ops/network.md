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

## netplan

- `/etc/netplan/01-network-manager-all.yaml`

```yaml
# Let NetworkManager manage all devices on this system
network:
  version: 2
  renderer: NetworkManager
  ethernets:
    eth1:
      dhcp4: no
      addresses: [192.168.52.250/24]
      gateway4: 192.168.52.254
      nameservers:
        addresses: [223.5.5.5, 8.8.8.8]
```
