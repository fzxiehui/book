# 环境


## python 版本管理

- 安装

    - 下载安装

        ```shell
        curl https://pyenv.run | bash
        ```

    - 配置`~/.bashrc`

        ```shell
        export PATH="$HOME/.pyenv/bin:$PATH"
        eval "$(pyenv init --path)"
        eval "$(pyenv virtualenv-init -)"
        ```

    - 当前`bash`生效配置`source ~/.bashrc`


- 使用

    ```shell
    pyenv install 3.9.0
    pyenv global 3.9.0
    python --version
    ```

## 虚拟环境

```shell
python -m venv venv
echo "*" > venv/.gitignore
```

## virtualenv

- 安装

```shell
sudo apt install python3-virtualenv
```

- 使用

```shell
# 创建
virtualenv venv

# 激活
source venv/bin/activate

# 停用
deactivate

# 直接使用
./venv/bin/python main.py
```
