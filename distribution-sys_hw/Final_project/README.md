# Distributed System2022_Team 5 Final project
## Spark env settings
### Supported system:
Our spark install and setting script store in forder- `settings`, you can execuate these script in
- Ubuntu
- Docker container
### Install & setting spark steps
1. `cd settings`
2. `./init_setting.sh`
3.  `./py_package.sh`
4.  `apt install openjdk-11-jdk`
5.  `./setting_java11.sh`
6.  `source /etc/profile.d/openjdk.sh`
7.  `./setting_spark.sh`
8.  `source ~/.bashrc`
9.  `./test_spark.sh`

### Execute spark steps:
1. `$SPARK_HOME/sbin/start-master.sh`
2. Connect to `localhost:8080` , and copy the link of master node, as shown as following picture.
  ![](https://i.imgur.com/H5vgjQK.png)
3. `start_3_worker.sh -m <link of master node>` 
4. Change your directory to where store spark codes
   - We stored some spark example codes in `sparkcodes/example` 
6. `pyspark --master <link of master node>`
7. Connect to `localhost:8888` 
   - You will see the jupyter lab interface
   - Input the password `dis1102`
     - You can change the password by editting `c.ServerApp.password` in `settings/jupyter_lab_config.py`
9. Execuate spark codes

### Try it
- http://140.119.164.197:8888/
  - Input the password `dis1102`

