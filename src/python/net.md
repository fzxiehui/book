# 网络

## tcp

### 服务端

```python 
import socket

# 创建套接字
server = socket.socket(socket.AF_INET,  # AF_INET = IPv4, AF_INET = IPv6
        socket.SOCK_STREAM, # 使用流式 tcp
        )

# 监听端口
server.bind(('127.0.0.1', 7001))

# 开始监听, 同时等待最大连接
server.listen(5)

while True:

    # 连接到来时会返回
    sock, addr = server.accept()

    # 连接信息
    print(addr)

    # 发送
    sock.send(b'hello client')

    # 接收欢迎信息
    print(sock.recv(1024).decode('utf-8'))

    # 关闭
    sock.close()
```

### 客户端

- `tcp_client.py`

```python
import socket

# 创建套接字
client = socket.socket(socket.AF_INET,  # AF_INET = IPv4, AF_INET = IPv6
        socket.SOCK_STREAM, # 使用流式 tcp
        )

# 连接
client.connect(('127.0.0.1', 7001))

# 接收欢迎信息
print(client.recv(1024).decode('utf-8'))

# 发送
client.send(b'hello server')

# 关闭连接
client.close()
```

## http

### 依赖

```shell
# 服务端
pip install Flask

# 客户端
pip install requests
```

### 服务端

- `http_server.py`

```python
from flask import Flask, request
import json
# from flask import jsonify

# 创建对象
app = Flask(__name__)

# 字符串
@app.route("/", methods=['POST', 'GET'])
def hello_world():
    return "<p>Hello, World!</p>"

# json
@app.route("/json")
def hello_json():
    return {
            "msg": "hello"
            }

# json 接收
@app.route("/post/json", methods=['POST'])
def hello_post_json():

    data = request.get_data()
    data = json.loads(data)
    print(data)
    print(data.get("name", ""))

    # return jsonify({})
    return {
            "msg": "hello"
            }


# 表单接收
@app.route("/post/form", methods=['POST'])
def hello_post_form():

    data = request.form
    print(data)
    for item in request.form:
        print(item)

    # return jsonify({})
    return {
            "msg": "hello"
            }

# 调试运行
# app.run('127.0.0.1', 7002)

# 生产运行
from wsgiref.simple_server import make_server
serve = make_server(app=app, host="0.0.0.0", port=7002)
serve.serve_forever()

```

### 客户端

- `http_client.py`

```python 
import requests
import json

# 获取字符串
r = requests.get('http://127.0.0.1:7002/')
print(r.status_code)
# >>>>>>>> 200
print(r.headers['content-type'])
# >>>>>>>> text/html; charset=utf-8
print(r.encoding)
# >>>>>>>> utf-8
print(r.text)
# >>>>>>>> <p>Hello, World!</p>

# 获取json
r = requests.get('http://127.0.0.1:7002/json')
print(r.headers['content-type'])
# >>>>>>>> application/json
print(r.json())
# >>>>>>>> {'msg': 'hello'}

# 发送json
data = {
    "name": "hello"
    }
r = requests.post('http://127.0.0.1:7002/post/json', data=json.dumps(data))
print(r.json())
# >>>>>>>> {'msg': 'hello'}

# 发送表单
data = {
    "name": "hello",
    "age": 12
    }
r = requests.post('http://127.0.0.1:7002/post/form', data=data)
print(r.json())
# >>>>>>>> {'msg': 'hello'}
```
