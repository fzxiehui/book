# 包处理

## 收发json包

- 发送

```python
# -*- coding: utf-8 -*-
import struct
import json
import threading
import socket

lock = threading.Lock()
client = socket.socket(
				socket.AF_INET, # ipv4
				socket.SOCK_STREAM) # 流
client.settimeout(30)
client.connect(("127.0.0.1", 10001))

msg = {
	"hello": "hello"
}
try:
	# 把字典转为 json
	json_data = json.dumps(msg).encode('utf-8')

	# 获取json长度
	length = len(json_data)

	# 通过 I = 无符号int, ! (=big-endian, 网络字节序)
	length_prefix = struct.pack("!I", length) 

	# 获取锁
	lock.acquire()
	# 发送报长度与报文
	client.sendall(length_prefix + json_data)

except Exception as e:
	raise Exception(f"发送报文失败! Error:{e}")

finally:
	# 解锁	
	lock.release()

client.close()
```

- 接收

```python
# -*- coding: utf-8 -*-
import json
import socket
import struct

# 创建套接字
server = socket.socket(
	socket.AF_INET,  # AF_INET = IPv4
	socket.SOCK_STREAM) # 使用流式 tcp

# 监听端口
server.bind(('0.0.0.0', 10001))

# 开始监听, 同时等待最大连接
server.listen(1)

# 只允许一个连接
while True:
	# 连接到来时会返回
	sock, addr = server.accept()

	# 连接信息
	print(addr)

	# 读取
	buf_len = sock.recv(4)
	if not buf_len:
		break

	length = struct.unpack('!I', buf_len)[0]
	data = b''

	while len(data) < length:
		packet = sock.recv(length-len(data))
		if not packet:
			break
		data += packet
	json_data = json.loads(data.decode('utf-8'))
	print(json_data)
```
