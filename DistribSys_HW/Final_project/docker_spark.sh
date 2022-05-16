docker container run -it -d --rm -p 8888:8888 -p 8080:8080 -p 8081:8081 -p 8082:8082 -p 8083:8083 -p 8001:8001 -p 8002:8002 -p 8003:8003 -p 4040:4040 -p 4041:4041 -p 4042:4042 -p 4043:4043 --mount type=bind,source=$PWD/sparkcodes,target=/root/DisSys_proj/sparkcodes --name ywt01-spark abc50111/spark:latest 

