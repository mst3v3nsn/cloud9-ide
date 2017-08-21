#!/bin/bash

useradd -u $CLOUD9_UID -g $CLOUD9_GID $CLOUD9_USER

sed -i -e 's/John Doe/$CLOUD9_DN/g' /cloud9/settings/standalone.js
sed -i -e 's/johndoe/$CLOUD9_USER/g' /cloud9/settings/standalone.js

su $CLOUD9_USER
