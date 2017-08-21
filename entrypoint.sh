#!/bin/bash

useradd -u $CLOUD9_UID -g $CLOUD9_GID $CLOUD9_USER
su $CLOUD9_USER
