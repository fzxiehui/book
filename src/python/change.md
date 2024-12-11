# 数据转换

@TODO

## 十六进制

- read.py

```python
import sys

# > python read.py 68 68 68 68 68
# > output: hhhhh

if __name__ == "__main__":
    
    if len(sys.argv) < 2:
        sys.exit()

    msg = sys.argv[1:]
    print("要转换的内容:", msg)

    hex_list = bytes([int(x, 16) for x in msg])

    print(hex_list.decode(encoding="utf-8"))
```

- write.py

```python
import sys

# > python write.py hhhhh
# > output: 68 68 68 68 68

if __name__ == "__main__":

    if len(sys.argv) != 2:
        sys.exit()

    msg = sys.argv[1]
    print("要转换的内容:", msg)


    print("要发送的内容:", end=" ")
    buf = str.encode(msg, encoding="utf-8")
    for i in buf:
        print("%x"%i, end=" ")

    print()
```
