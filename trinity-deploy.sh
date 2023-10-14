#!/bin/bash


#Dep install

apt update

apt install python3-numpy -y
apt install zlib1g-dev -y
apt install build-essential cmake libbz2-dev  libncurses5-dev libncursesw5-dev liblzma-dev autoconf zip bowtie2 salmon default-jre  -y


#samtools
mkdir -p /usr/bin/samtools-1.9/
cd /usr/bin/samtools-1.9/
wget https://github.com/samtools/samtools/releases/download/1.9/samtools-1.9.tar.bz2
tar -vxjf samtools-1.9.tar.bz2
cd samtools-1.9
make
export PATH="$PATH:/usr/bin/samtools-1.9/samtools-1.9"
source ~/.profile
#ref - https://www.biostars.org/p/328831/


#Jellyfish
mkdir -p /usr/bin/jellyfish
cd /usr/bin/jellyfish
wget https://github.com/gmarcais/Jellyfish/releases/download/v2.3.0/jellyfish-linux
mv /usr/bin/jellyfish/jellyfish-linux /usr/bin/jellyfish/jellyfish
export PATH="$PATH:/usr/bin/jellyfish"
chmod +x  /usr/bin/jellyfish/jellyfish

#trinity

mkdir -p /etc/trinity/trinity-deploy
cd /etc/trinity/trinity-deploy
wget https://github.com/trinityrnaseq/trinityrnaseq/releases/download/Trinity-v2.15.1/trinityrnaseq-v2.15.1.FULL_with_extendedTestData.tar.gz
tar -xvf trinityrnaseq-v2.15.1.FULL_with_extendedTestData.tar.gz
echo '#include <string>' | cat - /etc/trinity/trinity-deploy/trinityrnaseq-v2.15.1/trinity-plugins/bamsifter/sift_bam_max_cov.cpp > .tmp && mv .tmp /etc/trinity/trinity-deploy/trinityrnaseq-v2.15.1/trinity-plugins/bamsifter/sift_bam_max_cov.cpp
cd /etc/trinity/trinity-deploy/trinityrnaseq-v2.15.1/
make

export TRINITY_HOME=/etc/trinity/trinity-deploy/trinityrnaseq-v2.15.1


