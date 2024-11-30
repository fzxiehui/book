# 奇技淫巧

## git ssh-key

```shell
cat ~/.ssh/id_rsa.pub || ssh-keygen -t rsa -b 4096 -C "xie18960920183@outlook.com"
git config --global user.email "xie18960920183@outlook.com"
git config --global user.name "fzxiehui"
```

## ssh免密登录

```shell
ssh-copy-id username@remote-server
# e.g:
ssh-copy-id hello@172.16.1.251
# 相当于在 ~/.ssh/authorized_keys 追加公钥
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
