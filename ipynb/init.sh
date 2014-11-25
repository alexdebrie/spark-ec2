## Create ipython profile
echo -e "Setting iPython settings...."
ipython profile create default
echo "c.NotebookApp.ip = '*'" >> /root/.ipython/profile_default/ipython_notebook_config.py
echo "c.NotebookApp.open_browser = False" >> /root/.ipython/profile_default/ipython_notebook_config.py
echo "c.NotebookApp.port = 8880" >> /root/.ipython/profile_default/ipython_notebook_config.py

echo -e "import os\nos.environ['SPARK_HOME'] = '/root/spark'" >> /root/.ipython/profile_default/startup/00-pyspark-setup.py
echo -e "import sys\nsys.path.insert(0, '/root/spark/python')" >> /root/.ipython/profile_default/startup/00-pyspark-setup.py
echo -e "CLUSTER_URL = open('/root/spark-ec2/cluster-url').read().strip()" >> /root/.ipython/profile_default/startup/00-pyspark-setup.py
