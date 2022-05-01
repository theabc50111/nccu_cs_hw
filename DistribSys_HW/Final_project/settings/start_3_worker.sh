while getopts m: flag
do
    case "${flag}" in
        m) master_spark_url=${OPTARG};;
    esac
done

export SPARK_IDENT_STRING=worker-1
$SPARK_HOME/sbin/start-worker.sh --port 8001 --webui-port 8081 $master_spark_url
export SPARK_IDENT_STRING=worker-2
$SPARK_HOME/sbin/start-worker.sh --port 8002 --webui-port 8082 $master_spark_url
export SPARK_IDENT_STRING=worker-3
$SPARK_HOME/sbin/start-worker.sh --port 8003 --webui-port 8083 $master_spark_url
