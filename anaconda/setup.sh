#!/bin/bash

/root/spark-ec2/copy-dir /root/anaconda

for node in $SLAVES $OTHER_MASTERS; do
  ssh -t -t $SSH_OPTS root@$node 'echo "export PATH=/root/anaconda/bin:$PATH" >> /root/.bash_profile"'
  ssh -t -t $SSH_OPTS root@$node "source /root/.bash_profile"
done
