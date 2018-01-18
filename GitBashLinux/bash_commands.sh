#make a search engine of history
Ctrl+R

#selecting specific line of a file: each m-th line of n sequential partitions where m<n . eg 4th 9th 14th..line with m=4 n=5
sed -n 'm~np' cut_dataset2.csv > dataset_5D.csv


# INSTALL SUBLIME TEXT3


# Install the GPG key:
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
# Ensure apt is set up to work with https sources:
sudo apt-get install apt-transport-https;
# Update apt sources and install Sublime Text
sudo apt-get update && sudo apt-get install sublime-text;


# REMOTE COPY FILES
#https://askubuntu.com/questions/903038/how-to-copy-or-move-files-from-remote-machine-to-local-machine
#copy remote to local
scp -r remote_user@remote_ip:/path/to/file/on/remote /path/to/dump/file/on/local
#copy local to remote
scp -r /path/to/dump/file/on/local remote_user@remote_ip:/path/to/file/on/remote




# Set a keyboard shortcut in gnome-terminal:
Edit > Keyboard Shortcuts... > Terminal > Set Title    (Ctrl+Shift+Y)

#-------------------------------------

#check ubuntu-linux version 
cat /etc/lsb-release OR
lsb_release -irc OR
cat /etc/os-release

#check kernel version
uname -or

#Linux or UNIX, then check whether GCC is installed on your system
gcc -v

Password test@10.10.1.203 = triloq!234

# INSTALL GOOGLE CHROME
# Download the package (64 bit):
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
# Install the package, forcing install of dependencies:
sudo dpkg -i --force-depends google-chrome-stable_current_amd64.deb
# In case any dependencies didn't install (you would have a warning or failure message for this), you can force them via:
sudo apt-get install -f

#install firefox
sudo apt install firefox


#---------------------------------------
#Download and Install dropbox
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -	
sudo apt install python-gpgme #for dependecies
# https://www.linuxbabe.com/cloud-storage/install-dropbox-ubuntu-16-04


#---------------------------------------


# INSTALLING SPARK ON UBUNTU16 LTS
#extras: install anaconda3 for python3 at /home/user/anaconda3
bash <Anaconda3...sh>
#add into bashrc
export PATH="/home/test/anaconda3/bin:$PATH"
#then  Install Python Software Properties
sudo apt-get install python-software-properties
#for unmet dependencies
sudo apt-get -f install


#---------------------------------------
# ENSURE JAVA8 IS INSTALLED, should give java8 as output
java -version

#if not installed as follows
sudo apt-get update && sudo apt-get install default-jdk 



# INSTALL SCALA AS FOLLOWS
sudo apt-get install scala
# Run scala as follows
scala
#Test it with
println(“Hello World”)
# quit the Scala REPL with
:q

#------------------------------
# Configure PySpark driver for Jupyter notebook_Method-I
#add following in bashrc
export PYSPARK_DRIVER_PYTHON=jupyter
export PYSPARK_DRIVER_PYTHON_OPTS='notebook'

# https://www.datacamp.com/community/tutorials/apache-spark-tutorial-machine-learning


# Creating python virtual environment with anaconda
conda create -n <environment_name> python=<python_version>

#activate conda venv
source activate <environment_name>
# To deactivate this environment, use:
source deactivate <environment_name> spark_venv
#list of all envs
conda info --envs #or
conda env list

#--------------------------------
#activating jupyter with different python in conda environment
conda install notebook ipykernel
ipython kernel install --user


#---------------------------------
# to install Spark. We need git for this
sudo apt-get install -y git

#go to https://spark.apache.org/downloads.html and download a pre-built for Hadoop 2.7 version of Spark (preferably Spark 2.0 or later)
wget http://redrockdigimark.com/apachemirror/spark/spark-2.2.0/spark-2.2.0-bin-hadoop2.7.tgz
#in tgz format, extract as follows onto home
tar xzvf <spark-2.2.0-bin-hadoop2.7.tgz> #file name may differ
cd <spark-2.0.2-bin-hadoop2.7>/bin/

#move spark to user file
sudo cp <spark-2.2.0-bin-hadoop2.7> /usr/local/spark
# run spark-shell using
./spark-shell

#GO to spark UI at 	 http://10.10.1.203:4040/jobs/
#SINGLE NODE SETUP COMPLETE

# Configure Pyspark
#export pyspark
sudo mv spark-2.2.0-bin-hadoop2.7/ /opt/spark-2-2.0 #DIDN"T HELP
# 	Create a symbolic link: #DIDN"T HELP
sudo ln -s /opt/spark-2.2.0 /opt/spark̀


#spark path into bashrc
export SPARK_HOME=/home/test/spark-2.2.0-bin-hadoop2.7
export PATH=$PATH:$SPARK_HOME/bin

# Set SPARK_LOCAL_IP
# check for creating master machine

#pyspark setup
pip install pyspark
# Set SPARK_LOCAL_IP
# The master parameter is used for setting the master node address. Here we launch Spark locally on 2 cores for local testing.
$SPARK_PATH/bin/pyspark --master local[2] #NOT IMPLEMENTED YET


# testing needed{
}
export SPARK_HOME=/usr/local/Cellar/apache-spark/1.5.1
export PYTHONPATH=$SPARK_HOME/libexec/python:$SPARK_HOME/libexec/python/build:$PYTHONPATH
PYTHONPATH=$SPARK_HOME/python/lib/py4j-0.8.2.1-src.zip:$PYTHONPATH 
export PYTHONPATH=$SPARK_HOME/python:$SPARK_HOME/python/build:$PYTHONPATH
}




#Scrip to install anaconda 
CONTREPO=https://repo.continuum.io/archive/
# Stepwise filtering of the html at $CONTREPO
# Get the topmost line that matches our requirements, extract the file name.
ANACONDAURL=$(wget -q -O - $CONTREPO index.html | grep "Anaconda3-" | grep "Linux" | grep "86_64" | head -n 1 | cut -d \" -f 2)
wget -O ~/ANACONDA.sh $CONTREPO$ANACONDAURL
bash ANACONDA.sh -b -p ~/anaconda

# Q: What is going on here?

# wget -q -O - URL quietly (-q) gets the html at URL (in this case https://repo.continuum.io/archive/, which is accessed as $CONTREPO) and sends it to standard out (-O -).
# | is called "pipe", and sends the output of the preceding command to the next command.
# grep "text" returns the lines from its input that contain text. So first, we select all lines that contain "Anaconda3", then of those, we select all lines containing "Linux", and then all lines containing "86_64" (for the 64-bit version).
# head -n 1 returns the first line of the input. I rely on the website maintaining order so that the most recent version is on top.
# cut -d \" -f 2 splits the input on the double quote characters (-d \"), which surround the filename in the HTML's href, and returns the second field (-f 2), being the target of the href.

echo 'export PATH="~/anaconda/bin:$PATH"' >> ~/.bashrc 
# Refresh basically
source .bashrc
conda update conda




#_________________________
#printing all file(recurively) ending with .py in pwd to a new files
( find ./ -name '*.py' -print0 | xargs -0 cat ) > output.txt
#printing total line-count  of all file(recurively) ending with .py in pwd
( find ./ -name '*.py' -print0 | xargs -0 cat ) | wc -l
#printing linecount of all file(recurively) ending with .py in pwd
find . -name '*.py' | xargs wc -l 


#change ubuntu computer name to newname
sudo apt-get install gksu -y
gksu gedit /etc/hostname #enter the password and change hostname to desired name
gksu gedit /etc/hosts #enter the password and enter hostname in front of local as """127.0.1.1	<new_name>"
sudo service hostname start
sudo reboot

#Install Postgresql10 ubuntu
cd #go to home
# create file for key
sudo nano /etc/apt/sources.list.d/pgdg.list
#copy paste the text below
"deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main"
#Import the repository signing key
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
#update the package lists
sudo apt-get update
#install postgresql , also install any dependencies if required
sudo apt-get install postgresql-10 -y

# message
"
Success. You can now start the database server using:

    /usr/lib/postgresql/10/bin/pg_ctl -D /var/lib/postgresql/10/main -l logfile start

Ver Cluster Port Status Owner    Data directory              Log file
10  main    5432 down   postgres /var/lib/postgresql/10/main /var/log/postgresql/postgresql-10-main.log
"

#------------------------------------------------------------
#APACHE STORM & APACHE KAFKA INSTALLATION

#-----------------------------------------------------
#COMMON STEPS: JAVA INSTALLATION
# help
# https://www.wikihow.com/Install-Oracle-Java-JDK-on-Ubuntu-Linux
# https://www3.ntu.edu.sg/home/ehchua/programming/howto/JDK_Howto.html

# Verifying Java Installation
java -version;javac -version;

#go to www.oracle.com or http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html
#download jdk-<jdk_latest_version>-linux-x64.tar.gz

# Delete old and extract jdk in new directory
sudo apt-get purge openjdk-\*
sudo mkdir -p /usr/localjava
cd /usr/local/java
sudo tar xzvf ~/Downloads/jdk-<jdk_latest_version>-linux-x64.gz

# Setup the location of java, javac and javaws  : // --install symlink name path priority
sudo  update-alternatives --install /usr/bin/jar jar /usr/local/java/jdk<jdk_latest_version>/bin/jar 1
sudo  update-alternatives --install /usr/bin/java java /usr/local/java/jdk<jdk_latest_version>/bin/java 1
sudo  update-alternatives --install /usr/bin/javac javac /usr/local/java/jdk<jdk_latest_version>/bin/javac 1
sudo  update-alternatives --install /usr/bin/jps jps /usr/local/java/jdk<jdk_latest_version>/bin/jps 1
 # Use this Oracle JDK/JRE as the default   : // --set name path
sudo  update-alternatives --set jar /usr/local/java/jdk<jdk_latest_version>/bin/jar
sudo  update-alternatives --set javac /usr/local/java/jdk<jdk_latest_version>/bin/javac

# use these command to update java path in /etc/profile
echo  'export JAVA_HOME=/usr/local/java/jdk<jdk_latest_version>' >> /etc/profile
echo 'export PATH=$JAVA_HOME/bin:$PATH' >> /etc/profile
source /etc/profile
#-----------------------------------------------------


#------------------------------------------------------------
#APACHE STORM 
#First install ZooKeeper Framework
# Go to http://zookeeper.apache.org/releases.html#download
#download latest: today zookeeper-3.4.10.tar.gz
#zookeeper_version = 3.4.10
cd ~/Downloads/
tar -xf zookeeper-<zookeeper_version>.tar.gz
sudo mv zookeeper-<zookeeper_version>/ /opt/
cd /opt/zookeeper-<zookeeper_version>/
sudo mkdir data
# Create configuration file as follows
sudo nano conf/zoo.cfg
# paste following string in the file and save it
"""
tickTime=2000
dataDir=/opt/zookeeper-<zookeper_version>/data
clientPort=2181
initLimit=5
syncLimit=2
"""

#Start ZooKeeper Server from loaction opt/zookeeper-<zookeper_version>/
sudo bin/zkServer.sh start #or from anywhere using
sudo /opt/zookeeper-<zookeeper_version>/bin/zkServer.sh start
#Response like
"""ZooKeeper JMX enabled by default
Using config: /opt/zookeeper-<zookeeper_version>/bin/../conf/zoo.cfg
Starting zookeeper ... STARTED"""
# Start CLI
sudo /opt/zookeeper-<zookeeper_version>/bin/bin/zkCli.sh
#Response like
"""Connecting to localhost:2181
....many lines
[zk: localhost:2181(CONNECTED) 0]"""
#After performing all the operations,stop the ZooKeeper server
sudo /opt/zookeeper-<zookeeper_version/bin/zkServer.sh stop

#Apache Storm Framework Installation
#go to http://storm.apache.org/downloads.html and download latest storm 
#apache-storm-1.1.1.tar.gz : <storm_bersion> = 1.1.1
cd ~/Downloads/
tar -xf apache-storm-<storm_version>.tar.gz
sudo mv apache-storm-<storm_version>/ /opt/
cd /opt/apache-storm-<storm_version>/
sudo mkdir data

# Create configuration file as follows 
sudo nano conf/storm.yaml
# paste following string in the file and save it
"""
storm.zookeeper.servers:
 - "localhost"
storm.local.dir: “/opt/apache-storm-<storm_version>/data”
nimbus.host: "localhost"
supervisor.slots.ports:
 - 6700
 - 6701
 - 6702
 - 6703
"""
# Now type 3 these in different terminals
# Start the Nimbus
sudo /opt/apache-storm-<storm_version>/bin/storm nimbus  
# Start the Supervisor
sudo /opt/apache-storm-<storm_version>/bin/storm supervisor
# Start the UI
sudo /opt/apache-storm-<storm_version>/bin/storm ui
#go to Storm user interface application at URL http://localhost:8080 
	
#------------------------------------------------------------
# INSTALL and SETUP Eclipse for java

# Step-1 - set up JDK and verify Java installation as above
# download latest Eclipse IDE for Java Developers Linux 64-bit from http://www.eclipse.org/downloads/

# / Extract the tarball into /usr/local 
cd /usr/local
sudo tar xzf ~/Downloads/eclipse-jee-neon-2-linux-gtk-x86_64.tar.gz
# // (Optional) Change ownership
cd /usr/local
sudo chown -R <your-username>:<your-groupname> eclipse
   
   
 
# Set up a symlink to /usr/bin (which is in the PATH)
cd /usr/bin
sudo ln -s /usr/local/eclipse/eclipse
# Make a symlink in /usr/bin, which is in the PATH.
ls -ld /usr/bin/eclipse
#use to check the location of eclipse
which eclipse

# working on eclipse https://www.ntu.edu.sg/home/ehchua/programming/howto/EclipseJava_HowTo.html#jdk
#------------------------------------------------------------

POSTMAN SETUP
# Download from https://app.getpostman.com/app/download/linux64 OR
wget https://dl.pstmn.io/download/latest/linux64 -O postman.tar.gz
#extract and create a link
sudo tar -xzf postman.tar.gz -C /opt
sudo ln -s /opt/Postman/Postman /usr/bin/postman
#create an Unity desktop file for your launcher.
cat > ~/.local/share/applications/postman.desktop <<EOL
[Desktop Entry]
Encoding=UTF-8
Name=Postman
Exec=postman
Icon=/opt/Postman/resources/app/assets/icon.png
Terminal=false
Type=Application
Categories=Development;
EOL
#------------------------------------------------------------


# Clone habitual-demo git repo
git clone https://github.com/3LOQ/habitual-demo.git

#------------------------------------------------------------
# DOWNLOAD HPCC vERSION 6.0.2-1 AND ADDITIONAL FRAMEWORK FOR UBUNTU 16 LTS and UBuntu 14 LTS

#Main platform Ubuntu 16
wget http://cdn.hpccsystems.com/releases/CE-Candidate-6.0.2/bin/platform/hpccsystems-platform-community_6.0.2-1xenial_amd64.deb
#clienttools Ubuntu16
wget http://cdn.hpccsystems.com/releases/CE-Candidate-6.0.2/bin/clienttools/hpccsystems-clienttools-community_6.0.2-1xenial_amd64.deb
#python module ubuntu 16
wget http://cdn.hpccsystems.com/releases/CE-Candidate-6.0.2/bin/plugins/hpccsystems-plugin-pyembed_6.0.2-1xenial_amd64.deb
#Main platform Ubuntu 14
wget http://cdn.hpccsystems.com/releases/CE-Candidate-6.0.2/bin/platform/hpccsystems-platform-community_6.0.2-1trusty_amd64.deb
#clienttools Ubuntu14
wget http://cdn.hpccsystems.com/releases/CE-Candidate-6.0.2/bin/clienttools/hpccsystems-clienttools-community_6.0.2-1trusty_amd64.deb
#python module ubuntu 14
wget http://cdn.hpccsystems.com/releases/CE-Candidate-6.0.2/bin/plugins/hpccsystems-plugin-pyembed_6.0.2-1trusty_amd64.deb

#ML_module
wget http://cdn.hpccsystems.com/install/ml/stable/hpcc-systems-ecl-ml.zip

#ML Reference 
wget http://wpc.423a.rhocdn.net/00423A/pdf/machinelearning.pdf
#ECLProgrammersGuide
wget http://cdn.hpccsystems.com/releases/CE-Candidate-6.4.4/docs/ECLProgrammersGuide-6.4.4-1.pdf
#ECLStandardLibraryReference
wget http://cdn.hpccsystems.com/releases/CE-Candidate-6.4.4/docs/ECLStandardLibraryReference-6.4.4-1.pdf


#------------------------------------------------------------
# Robomongo installation
wget https://download.robomongo.org/1.1.1/linux/robo3t-1.1.1-linux-x86_64-c93c6b0.tar.gz
tar -xvzf robo3t-1.1.1-linux-x86_64-c93c6b0.tar.gz
sudo mkdir /usr/local/bin/robomongo
sudo cp -rf robo3t-1.1.1-linux-x86_64-c93c6b0/* /usr/local/bin/robomongo

# Further help -> https://askubuntu.com/questions/739297/how-to-install-robomongo-on-ubuntu/781793
#------------------------------------------------------------
# APACHE MESOS download
wget http://redrockdigimark.com/apachemirror/mesos/1.4.1/mesos-1.4.1.tar.gz

#------------------------------------------------------------
# Spark notebook debian 
wget http://spark-notebook.io/dl/deb/0.7.0/2.11/2.1.0/2.7.2/true/true

Code repo of learningPySpark
git clone https://github.com/drabastomek/learningPySpark.git

#------------------------------------------------------------
du --block-size=100000 --max-depth=3| sort -n
du --max-depth=3 	
tree -L 3 <dir_name_optional>

#install flash Ubuntu
sudo apt install flashplugin-installer

#-----------------------------------------------------------
#RUN JUPYTER FROM REMOTE MACHINE--------------------------
# On the remote machine, start the IPython notebooks server:
jupyter-notebook --no-browser --port=9000
# On the local machine, start an SSH tunnel:
ssh -N -f -L localhost:9001:localhost:9000 remote_user@remote_host
#The first option -N tells SSH that no remote commands will be executed, and is useful for port forwarding. The second option -f has the effect that SSH will go to background, so the local tunnel-enabling terminal remains usable. The last option -L lists the port forwarding configuration (remote port 8889 to local port 8888).

#open localhost:9001 in local machine to access jupyter notebook
# To close the SSH tunnel from local machine
ps aux | grep localhost:9000
kill -15 <pid>
#-----------------------------------------------------------
sudo wget http://redrockdigimark.com/apachemirror/spark/spark-2.2.0/spark-2.2.0-bin-hadoop2.7.tgz
sudo mkdir /usr/local/spark
sudo tar xzvf spark-2.2.0-bin-hadoop2.7.tgz -C /usr/local/spark/
sudo cp -r spark-2.2.0-bin-hadoop2.7 /usr/local/spark
cd /usr/local/spark/spark-2.2.0-bin-hadoop2.7/bin/ 
./spark-shell 
cd
pip install pyspark
pip install findspark



import findspark
# findspark.init("/usr/local/spark/spark-2.2.0-bin-hadoop2.7/")
findspark.init("/usr/local/java/jdk<jdk_latest_version>2.2.0-bin-hadoop2.7/")

from pyspark import SparkConf, SparkContext
conf = (SparkConf().setMaster("local").setAppName("My app").set("spark.executor.memory", "1g"))
sc = SparkContext(conf = conf)

a=[1,4,3,5]
a = sc.parallelize(a)
print(a)
print(a.take(2))

conda create -n sparkenv python=3.6
source activate sparkenv
conda install jupyter
jupyter-notebook
#if any error, run following 2 command
jupyter-notebook
echo 'unset XDG_RUNTIME_DIR' >> ~/.bashrc
source .bashrc
#-----------------------------------------------------------
Mimic a directory structure recursively with file names and sub-directories without content
#Source:https://stackoverflow.com/questions/11946465/copy-a-directory-structure-with-file-names-without-content

cp -r --attributes-only <source_dir> <target_dir>
Also check in link
find <source_dir>/ -type d -exec mkdir -p <target_dir>/{} \; \
       -o -type f -exec touch <target_dir>/{} \;

#-----------------------------------------------------------
#sshpass: An Excellent Tool for Non-Interactive SSH Login
sudo apt-get install sshpass

$ wget http://sourceforge.net/projects/sshpass/files/latest/download -O sshpass.tar.gz
$ tar -xvf sshpass.tar.gz
$ cd sshpass-1.06
$ ./configure
# sudo make install  

#-----------------------------------------------------------
#install & run H20
cd ~/Downloads; mkdir H20; cd H20/;
wget http://h2o-release.s3.amazonaws.com/h2o/rel-wheeler/4/h2o-3.16.0.4.zip
unzip h2o-3.16.0.4.zip  #assuming unzip is pre-installed
cd h2o-3.16.0.4/
java -jar h2o.jar


#use Ctrl+C to stop running
#open new terminal tab
xdg-open http://192.168.1.104:54321;

#-----------------------------------------------------------
docker:
Download latest: wget https://store.docker.com/editions/community/docker-ce-server-ubuntu

link: https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-16-04
First, add the GPG key for the official Docker repository to the system:

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

Add the Docker repository to APT sources:

    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

Next, update the package database with the Docker packages from the newly added repo:

    sudo apt-get update

Make sure you are about to install from the Docker repo instead of the default Ubuntu 16.04 repo:

    apt-cache policy docker-ce

You should see output similar to the follow:
Output of apt-cache policy docker-ce

docker-ce:
  Installed: (none)
  Candidate: 17.03.1~ce-0~ubuntu-xenial
  Version table:
     17.03.1~ce-0~ubuntu-xenial 500
        500 https://download.docker.com/linux/ubuntu xenial/stable amd64 Packages
     17.03.0~ce-0~ubuntu-xenial 500
        500 https://download.docker.com/linux/ubuntu xenial/stable amd64 Packages

Notice that docker-ce is not installed, but the candidate for installation is from the Docker repository for Ubuntu 16.04. The docker-ce version number might be different.

Finally, install Docker:

    sudo apt-get install -y docker-ce

Docker should now be installed, the daemon started, and the process enabled to start on boot. Check that its running:

    sudo systemctl status docker

The output should be similar to the following, showing that the service is active and running:

Output
● docker.service - Docker Application Container Engine
   Loaded: loaded (/lib/systemd/system/docker.service; enabled; vendor preset: enabled)
   Active: active (running) since Sun 2016-05-01 06:53:52 CDT; 1 weeks 3 days ago
     Docs: https://docs.docker.com
 Main PID: 749 (docker)

#-----------------------------------------------------------
XGBOOST
git clone --recursive https://github.com/dmlc/
cd xgboost; make -j4
OR
pip install xgboost

#-----------------------------------------------------------

LightGBM uses CMake to build. Run the following commands:

sudo apt install cmake -y;
triloq123

git clone --recursive https://github.com/Microsoft/LightGBM ; cd LightGBM
mkdir build ; cd build
cmake ..
make -j4

OR 

pip install lightgbm


#-----------------------------------------------------------
