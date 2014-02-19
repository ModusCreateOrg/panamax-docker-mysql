FROM ubuntu:quantal
MAINTAINER Chaitanya Akkineni <chaitanya.akkineni@savvis.com>

# Install packages
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y upgrade

# Add image configuration and scripts
RUN apt-get install -y mysql-server

ADD my.cnf /etc/mysql/conf.d/my.cnf
ADD run /usr/local/bin/run
RUN chmod +x /usr/local/bin/run

VOLUME ["/var/lib/mysql"]
EXPOSE 3306
CMD ["/usr/local/bin/run"]
