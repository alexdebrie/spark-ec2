#!/bin/bash

/root/spark-ec2/copy-dir /root/anaconda

NEW_PATH="export PATH=/root/anaconda/bin:$PATH"

# Need to figure out how to add /root/anaconda to $PATH on slave nodes.
for node in $SLAVES $OTHER_MASTERS; do
  ssh -t -t $SSH_OPTS root@$node "echo $NEW_PATH >> /root/.bash_profile"
  ssh -t -t $SSH_OPTS root@$node "source /root/.bash_profile"
done
