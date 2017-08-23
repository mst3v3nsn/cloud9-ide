#!/bin/bash

useradd -u $CLOUD9_UID $CLOUD9_USER

sed -i -e "s/John Doe/$CLOUD9_DN/g" /cloud9/plugins/c9.vfs.standalone/standalone.js
sed -i -e "s/johndoe/$CLOUD9_USER/g" /cloud9/plugins/c9.vfs.standalone/standalone.js
sed -i -e "s/example.org/cs.odu.edu/g" /cloud9/plugins/c9.vfs.standalone/standalone.js 
sed -i -e "s/root/$CLOUD9_USER/g" /etc/supervisor/conf.d/cloud9.conf

supervisord -c /etc/supervisor/supervisord.conf
