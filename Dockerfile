FROM registry.access.redhat.com/rhel7

ADD ./open.repo /etc/yum.repos.d/open.repo

RUN yum clean all
RUN yum -y install java-1.7.0-openjdk.x86_64 unzip

#RUN curl -k -o unzip-6.0-15.el7.x86_64.rpm -L ftp://ftp.pbone.net/mirror/ftp.scientificlinux.org/linux/scientific/7.2/x86_64/os/Packages/unzip-6.0-15.el7.x86_64.rpm && rpm -Uvh unzip-6.0-15.el7.x86_64.rpm
#RUN curl -k -o java-1.7.0-openjdk-1.7.0.91-2.6.2.3.el7.x86_64.rpm -L ftp://195.220.108.108/linux/centos/7.2.1511/os/x86_64/Packages/java-1.7.0-openjdk-1.7.0.91-2.6.2.3.el7.x86_64.rpm && rpm -Uvh java-1.7.0-openjdk-1.7.0.91-2.6.2.3.el7.x86_64.rpm

#RUN curl -k -o unzip-6.0-2.el6_6.x86_64.rpm -L ftp://rpmfind.net/linux/centos/6.7/os/x86_64/Packages/unzip-6.0-2.el6_6.x86_64.rpm && rpm -Uvh unzip-6.0-2.el6_6.x86_64.rpm
#RUN curl -k -o java-1.7.0-openjdk-1.7.0.95-2.6.4.0.el6_7.x86_64.rpm -L ftp://195.220.108.108/linux/centos/6.7/updates/x86_64/Packages/java-1.7.0-openjdk-1.7.0.95-2.6.4.0.el6_7.x86_64.rpm && rpm -Uvh java-1.7.0-openjdk-1.7.0.95-2.6.4.0.el6_7.x86_64.rpm

RUN curl -k -o sonar.zip -L https://sonarsource.bintray.com/Distribution/sonarqube/sonarqube-5.4.zip && unzip sonar.zip && chmod -R 777 /sonarqube-5*/logs /sonarqube-5.4/bin/linux-x86-64 /sonarqube-5.4/temp /sonarqube-5.4/data /sonarqube-5.4/extensions /sonarqube-5.4/web && rm sonar.zip
ADD sonar.properties /sonarqube-5.4/conf/sonar.properties

EXPOSE 9000



#CMD /sonarqube-5.4/bin/linux-x86-64/sonar.sh console


# Simple startup script to avoid some issues observed with container restart
#ADD myscript.sh /myscript.sh
#RUN chmod -v +x /myscript.sh
#CMD ["/myscript.sh"]
#RUN apt-get update && apt-get install -y curl unzip default-jre
