#ident	"%W%"
echo "Start postinstall..."
trap "exit 3" 1 2 3 15

# Set some initial variables
OPTDIR=$RPM_INSTALL_PREFIX
INST_BASE=`dirname $OPTDIR`
VERSION=`basename $OPTDIR`
VARDIR=/var$INST_BASE

echo OPTDIR is $OPTDIR
echo INST_BASE is $INST_BASE
echo VERSION is $VERSION
echo VARDIR is $VARDIR

#LOGDIR=$VARDIR/log
INS_ENV=

pkgowner=skynet
pkggroup=skynet

#start Read ENVIRONMENT 
echo start Read ENVIRONMENT...
HOST_NAME=`hostname`
case "${HOST_NAME}" in
    "devserver")
        INS_ENV="DEV" ;;
    *)
        INS_ENV="DEV";;
esac

#INS_ENV="UAT"

echo HOST is $HOST_NAME
echo ENVIRONMENT is $INS_ENV
echo RPM_INSTALL_PREFIX is $OPTDIR


#Create ENV file
echo $INS_ENV >$OPTDIR/conf/EnvConfig
#change file owner/group to skynet
chown $pkgowner:$pkggroup $OPTDIR
echo "Export env done!"


##
##  Create a link to the current install.
##
cd $INST_BASE

if [ -h current ]
then
  rm  current
elif [ -d current ]
then
	echo "ERROR: $INST_BASE/current not a sym-link."
	exit 1
fi

echo "Linking $OPTDIR to $INST_BASE/current"
ln -s $VERSION current

##
## Create log link
##
#cd current
#if [ -h log ]
#then
#  rm  log
#elif [ -d log ]
#then
#	echo "ERROR: $INST_BASE/current/log not a sym-link."
#	exit 1
#fi

##echo "Linking $LOGDIR to $INST_BASE/current/log"
##if [ ! -d "$LOGDIR" ]
##then
##	mkdir -p $LOGDIR
##fi
##chown $pkgowner:$pkggroup $LOGDIR
##ln -s $LOGDIR log
##cd -


owner=`ls -ld $INST_BASE | awk '{printf($3)}'`
group=`ls -ld $INST_BASE | awk '{printf($4)}'`
echo owner is $owner
echo group is $group

if [ ${owner} != $pkgowner -o ${group} != $pkggroup ]
then
	chown -R $pkgowner:$pkggroup $INST_BASE
fi
echo "End postinstall..."
