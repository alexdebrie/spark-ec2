#!/bin/bash

/root/spark-ec2/copy-dir /root/anaconda

echo "export PYSPARK_PYTHON=/root/anaconda/bin/python" >> /root/spark-ec2/templates/root/spark/conf/spark-env.sh
