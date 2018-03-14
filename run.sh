#!/bin/sh
#ident  "%W%"

JVM_ARG="-Xmx2048m -Xms2048m -Dcom.sun.management.jmxremote.port=4600 -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false"

APPLICATION_ARTIFACT_ID="spring-boot-eureka-server"

JRE_HOME="/opt/jre/1.8.0_131l64"
if [ ! -d "$JRE_HOME" ]; then
 JRE_HOME="/export/opt/jre/1.8.0_131l64"
 if [ ! -d "$JRE_HOME" ]; then
 	JRE_HOME="/opt/jre/1.8.0_65l64"
 fi
fi
#echo "JRE_HOME: $JRE_HOME"
JAVA=$JRE_HOME/bin/java
#echo "JAVA: $JAVA"

WORK_DIR=$(dirname $(readlink -f $0))
#echo "WORK_DIR : $WORK_DIR"

BASE_DIR=`dirname $0`/..
BASE_DIR=`(cd "$BASE_DIR"; pwd)`
#echo "BASE_DIR: $BASE_DIR"
JAR_PATH="$BASE_DIR/lib"
#echo "JAR_PATH: $JAR_PATH"

if [ $# -ne 1 ] ;
then
  echo "Please type necessary info as following sample:"
  echo "Sample: $0 (start | stop | status | restart)"
exit 1
fi

HOSTNAME=$HOSTNAME
#echo "HOSTNAME: $HOSTNAME"
case $HOSTNAME in
'devserver') 
  ENV="DEV" 
  ;;
*)
  ENV="DEV" 
  ;;
esac
#echo "ENV: $ENV"

EUREKA_INSTANCE_HOSTNAME="--eureka.instance.hostname=$(hostname -f)"

ACTION=$1
#echo "ACTION:$ACTION"
ENV_ARG="--spring.profiles.active=$ENV"
#echo "ENV_ARG: $ENV_ARG"


APPLICATION_DIR=`(cd "$WORK_DIR"; pwd)`
#echo "APPLICATION_DIR: $APPLICATION_DIR"
cd $APPLICATION_DIR

[ -z $APPLICATION_NAME ] && APPLICATION_NAME=`pwd -P | awk -F"/" '{print $(NF-2)}'`
[ -z $APPLICATION_VERSION ] && APPLICATION_VERSION=`pwd -P | awk -F"/" '{print $(NF-1)}'`

APPLICATION_KEY="KEY_"$APPLICATION_NAME

APPLICATION_JAR_PATH="$JAR_PATH/$APPLICATION_ARTIFACT_ID-$APPLICATION_VERSION.jar"
#echo "APPLICATION_JAR_PATH: $APPLICATION_JAR_PATH"

printvars()
{
    echo
	echo "ACTION:$ACTION"
	echo "ENV: $ENV"
	echo "HOSTNAME: $HOSTNAME"
    echo "=============================================Service info==========================================="
    echo "APPLICATION_DIR: $APPLICATION_DIR"
    echo "APPLICATION_KEY: $APPLICATION_KEY"
    echo "APPLICATION_NAME: $APPLICATION_NAME"
    echo "APPLICATION_VERSION: $APPLICATION_VERSION"
    echo
    echo "JRE_HOME: $JRE_HOME"
	echo "JAVA: $JAVA"
	echo "APPLICATION_JAR_PATH: $APPLICATION_JAR_PATH"
    echo "============================================Service info========================================================"
    echo
}

execute()
{
    JCOMMAND="$JAVA $JVM_ARG -jar $APPLICATION_JAR_PATH $ENV_ARG $EUREKA_INSTANCE_HOSTNAME -DAPP=$APPLICATION_KEY"

    echo Executing: $JCOMMAND
    $JCOMMAND >>/dev/null&

    echo "Started $APPLICATION_NAME."

    exit 0
}

PID=`pgrep -f "APP=$APPLICATION_KEY"`

case $ACTION in
'start')

   if [ "x$PID" != "x" ];then
          echo "Skip start, $APPLICATION_NAME is already running pid=$PID..."

   else
		  printvars
          execute
   fi
   ;;

'stop')

   printvars
   if [ "x$PID" != "x" ];then
      echo "Stopping $APPLICATION_NAME pid=$PID..."
      kill -9 $PID
   else
      echo "$APPLICATION_NAME service is not running"
   fi
   ;;
   
'debug')

   if [ "x$PID" != "x" ];then
          echo "Skip start, $APPLICATION_NAME is already running pid=$PID..."

   else
          printvars
          execute
   fi
   ;;

'status')

   printvars
   if [ "x$PID" != "x" ];then
      echo "$APPLICATION_NAME is running pid=$PID..."
   else
      echo "$APPLICATION_NAME service is not running"
   fi
   ;;
   
'restart')

   printvars
   if [ -n "$PID" ];then
      echo "Stopping $APPLICATION_NAME pid=$PID..."
      kill -9 $PID
      while [ -n "$PID" ];
      do
          sleep 1
          PID=`pgrep -f "APP=$APPLICATION_KEY"`
      done
   else
      echo "Starting $APPLICATION_NAME ..."
   fi
   execute
   ;;

*)
   echo "Pass action [start | stop | status | restart] to shell!"
   ;;
esac
