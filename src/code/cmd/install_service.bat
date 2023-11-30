@echo off

:: 以管理员身份打开时也能定位到当前目录
cd /d "%~dp0"

:: 服务名
set server_name=th

:: 启动参数
set app_args=start -c config.yaml

:: 应用名
set app_name=thumper.exe

:: 安装路径(直接用当前目录安装)
:: set install_path=%cd%
:: 安装路径
set install_path=c:\soft\thumper

:: 检查当前目录是否有 nssm.exe

if not exist %cd%/nssm.exe (
	echo 错误：没有nssm文件, 安装失败
	goto end
)

if not exist %cd%/%app_name% (
	echo 错误：没有%app_name%文件, 安装失败
	goto end
)


:: nssm 删除已经有服务
%cd%/nssm.exe stop %server_name%
%cd%/nssm.exe remove %server_name% confirm

:: 如果不是当前目录安装，复制文件到目标目录
if %install_path% neq %cd% (
	:: 删除目标目录
	rmdir /S /Q %install_path%
	:: 创建目标目录
	mkdir %install_path%
	:: 把相关文件复制到目标目录下
	copy %cd% %install_path%
)


:: 创建日志目录
mkdir %install_path%\logs

:: nssm install
%install_path%/nssm.exe install %server_name% %install_path%/%app_name% %app_args%

:: 意外退出等30秒
%install_path%/nssm.exe set %server_name% AppThrottle 30000

:: 设置日志目录
%install_path%/nssm.exe set %server_name% AppStdout %install_path%/logs/info.log
%install_path%/nssm.exe set %server_name% AppStderr %install_path%/logs/error.log

:: 开启服务
%install_path%/nssm.exe start %server_name%

echo 安装成功

:end
pause
