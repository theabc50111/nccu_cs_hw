# download & unzip spark
wget https://dlcdn.apache.org/spark/spark-3.2.1/spark-3.2.1-bin-hadoop3.2.tgz
tar -xvf spark-3.2.1-bin-hadoop3.2.tgz -C /usr/local
mv /usr/local/spark-3.2.1-bin-hadoop3.2 /usr/local/spark

# set enviroment variable of spark
SPARK_HOME="/usr/local/spark"
echo "
# Set Spark env. 
# SPARK_HOME=\"/usr/local/spark\"
export SPARK_HOME=$SPARK_HOME
export PATH=\"$SPARK_HOME/bin:$PATH\"
export PYSPARK_DRIVER_PYTHON=\"jupyter\"
export PYSPARK_DRIVER_PYTHON_OPTS=\"lab --no-browser --port=8888\"
">> ~/.bashrc 

# set config spark
cp $SPARK_HOME/conf/spark-env.sh.template $SPARK_HOME/conf/spark-env.sh
mkdir $SPARK_HOME/pids
mkdir $SPARK_HOME/recovery
echo "
# Set pyspark python
export PYSPARK_PYTHON=/usr/bin/python3

# Set spark cluster
SPARK_WORKER_CORES=4
SPARK_WORKER_MEMORY=7g
export SPARK_PID_DIR=$SPARK_HOME/pids
export SPARK_DAEMON_JAVA_OPTS=\"-Dspark.deploy.recoveryMode=FILESYSTEM -Dspark.deploy.recoveryDirectory=$SPARK_HOME/recovery\"
" >> $SPARK_HOME/conf/spark-env.sh

cp $SPARK_HOME/conf/spark-defaults.conf.template $SPARK_HOME/conf/spark-defaults.conf
echo "
# spark driver settings
spark.driver.cores 12
spark.driver.memory 22g

# spark executor setting
spark.executor.memory 3g
spark.executor.cores 2

# For Java 11, required settings
# for Apache Arrow library
spark.driver.extraJavaOptions=\"-Dio.netty.tryReflectionSetAccessible=true\"
spark.executor.extraJavaOptions=\"-Dio.netty.tryReflectionSetAccessible=true\"
" >> $SPARK_HOME/conf/spark-defaults.conf

