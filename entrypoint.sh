#!/bin/bash

useradd -u $CLOUD9_UID $CLOUD9_USER

sed -i -e 's@John Doe@'"$CLOUD9_DN"'@' /cloud9/plugins/c9.vfs.standalone/standalone.js
sed -i -e 's@@'"$CLOUD9_USER"'@' /etc/supervisor/conf.d/cloud9.conf

su $CLOUD9_USER
