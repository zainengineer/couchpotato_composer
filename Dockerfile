## Base image to use
FROM debian:latest

ENV DEBIAN_FRONTEND noninteractive

# setup workdir
RUN mkdir -p /root/work/
WORKDIR /root/work/

# install git
RUN apt-get -y update 
RUN apt-get -y install apt-utils
RUN apt-get -y install git
RUN apt-get -y install python


## Install Couchpotato
RUN mkdir /opt/couchServer
# RUN cd /opt/couchServer 
RUN git clone https://github.com/RuudBurger/CouchPotatoServer.git /opt/couchServer/CouchPotatoServer
# 
## Expose port
EXPOSE 5050

## Set working directory
# WORKDIR /opt
#CMD ["((/sbin/ip route|awk '/default/ { print $3 }' && echo 'zhostmachine )  | xargs echo -n) >> /etc/hosts"]
ENTRYPOINT ["((/sbin/ip route|awk '/default/ { print $3 }' && echo 'zhostmachine )  | xargs echo -n) >> /etc/hosts"]
ENTRYPOINT ["echo  >> /etc/hosts"]
ENTRYPOINT ["touch /root/work/test.txt"]
## Run Couchpotato
ENTRYPOINT ["python", "/opt/couchServer/CouchPotatoServer/CouchPotato.py"]