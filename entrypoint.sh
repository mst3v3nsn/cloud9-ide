#!/bin/bash

set -e

useradd -u $CLOUD9_UID $CLOUD9_USER

sed "s/John Doe/$CLOUD9_DN/g" /cloud9/plugins/c9.vfs.standalone/standalone.js
sed "s/johndoe/$CLOUD9_USER/g" /cloud9/plugins/c9.vfs.standalone/standalone.js

sed "s/root/$CLOUD9_USER/g" /etc/supervisor/conf.d/cloud9.conf

su $CLOUD9_USER
