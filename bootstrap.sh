#!/usr/bin/env bash

sudo apt-get update
sudo apt-get -y dist-upgrade
sudo sh -c 'echo "deb http://cran.rstudio.com/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list'
gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9
gpg -a --export E084DAB9 | sudo apt-key add -
sudo apt-get -y update
sudo apt-get -y install r-base
sudo apt-get -y install gdebi-core
wget https://download2.rstudio.org/rstudio-server-0.99.489-amd64.deb
sudo gdebi --n rstudio-server-0.99.489-amd64.deb
sudo adduser clay --gecos "Clay Noyes,,," --disabled-password
echo clay:clay | sudo chpasswd
sudo apt-get -y install r-cran-rjava
sudo apt-get -y install libgsl0-dev
sudo su - -c "R -e \"install.packages(c('e1071', 'rpart', 'igraph', 'caret', 'kernlab', 'randomForest', 'glmnet', 'ROCR', 'gbm', 'party', 'arules', 'tree', 'klaR', 'RWeka', 'ipred', 'lars', 'earth', 'CORElearn', 'mboost', 'xgboost', 'ggplot2', 'shiny', 'magrittr', 'DMwR', 'unbalanced', 'sqldf', 'forecast', 'plyr', 'dplyr', 'stringr', 'lubridate', 'qcc', 'reshape2', 'tm', 'googleVis', 'topicmodels', 'lda', 'openNLP', 'wordcloud'), repos = 'http://cran.rstudio.com/')\""

