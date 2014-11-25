#!/bin/bash

/root/spark-ec2/copy-dir /root/anaconda

# Need to figure out how to add /root/anaconda to $PATH on slave nodes.
for node in $SLAVES $OTHER_MASTERS; do
  ssh -t -t $SSH_OPTS root@$node "source /root/.bash_profile"
done
