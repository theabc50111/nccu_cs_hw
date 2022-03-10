import socket

client = socket.socket(family=socket.AF_INET, 
                       type=socket.SOCK_DGRAM)
client.connect(("127.0.0.1", 20213))
msg = b"This is a test from python client"
client.send(msg)
while True:
    rec_msg, address = client.recvfrom(1024)
    if rec_msg:
        print(f"r{rec_msg.decode('utf-8')}")
        client.close()
        break
print("finish client")
