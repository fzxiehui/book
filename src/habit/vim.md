# Neo-Vim

## 下载安装

- 下载

```shell
wget https://github.com/neovim/neovim/releases/download/v0.6.1/nvim-linux64.tar.gz
sudo cp nvim-linux64.tar.gz /usr/local/
cd /usr/local
sudo tar -zxvf nvim-linux64.tar.gz
```

- 安装

```shell
echo "export PATH="/usr/local/nvim-linux64/bin:\$PATH"" >> ~/.bashrc
# 设置默认编辑器
echo export EDITOR=/usr/local/nvim-linux64/bin/nvim >> ~/.bashrc
source ~/.bashrc
```

## 安装依赖

```shell
# install curl
sudo apt install curl

# install pip, pip3
# sudo apt install python-pip
# sudo apt install python3-pip

# install npm, nodejs
sudo apt install npm
sudo npm install n -g
sudo n stable
# 如果Node.js 版本过高，会导致npm安装插件失败，可以使用 sudo n v16.15.0 降低版本
sudo n v16.15.0

# install neovim, pynvim
sudo npm install -g neovim
# sudo pip3 install pynvim
# sudo pip install pynvim

# install git
sudo apt install git

# install ctags, fzf, ag
### sudo apt install ctags
sudo apt-get install exuberant-ctags
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
sudo apt install silversearcher-ag

sudo apt install xclip
```

## nvim 配置文件`~/.config/nvim/init.vim`

<<< @/src/code/habit/init.vim

## coc配置文件`~/.config/nvim/coc-settings.json`

<<< @/src/code/habit/coc-settings.json

## 下载安装`plug`

```shell
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

## 检测环境

```shell
# 允许 Perl 出错, 其他错误会导致后续安装失败
nvim
:checkhealth
```

## 插件安装

如果Go环境出现问题, 可以尝试使用 `:GoInstallBinaries` 命令

```shell
$ nvim
:PlugInstall

:CocInstall coc-git
:CocInstall coc-go
```
