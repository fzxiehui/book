# 常用服务docker-compose配置

## MySQL

::: details 点击查看配置文件
<<< @/src/code/docker-compose/mysql.yml
:::

## Redis

::: details 点击查看配置文件
<<< @/src/code/docker-compose/redis.yml
:::

## EMQX

::: details 点击查看配置文件
<<< @/src/code/docker-compose/emqx.yml
:::

## SVN

- 启动后 url `ip:13690/svnadmin`
- Subversion authorization file : `/etc/subversion/subversion-access-control`
- User authentication file (SVNUserFile) : `/etc/subversion/passwd`
- Parent directory of the repositories (SVNParentPath) : `/home/svn`
- Subversion client executable : `/usr/bin/svn`
- Subversion admin executable : `/usr/bin/svnadmin`
```shell
mkdir config
mkdir repo
touch config/passwd
echo "[groups]" >> config/subversion-access-control
echo >> config/subversion-access-control
echo "[/]" >> config/subversion-access-control
echo "* = r" >> config/subversion-access-control
chmod -R a+w config/
chmod -R a+w repo/
```

::: details 点击查看配置文件
<<< @/src/code/docker-compose/svn.yml
:::

