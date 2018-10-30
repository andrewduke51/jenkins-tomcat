#!/bin/sh
DIR=${DEPLOY_DIR:-/maven}
echo "Checking *.war in $DIR"
if [ -d $DIR ]; then
  WARS=`ls $DIR | grep '.war'`
  for i in $WARS; do
    echo "Copying $i to /opt/tomcat/webapps/"
    cp /$DIR/$i /opt/tomcat/webapps/$i
  done
 else
  echo "No .war files in $DIR"
fi

# Use faster (though more unsecure) random number generator
export CATALINA_OPTS="$CATALINA_OPTS -Djava.security.egd=file:/dev/./urandom"
/opt/tomcat/bin/catalina.sh run
