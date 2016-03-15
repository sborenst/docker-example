FROM registry.access.redhat.com/rhel6

ADD ./openshift-origin-deps.repo /etc/yum.repos.d/openshift-origin-deps.repo

RUN yum -y update

# Install packages necessary to install and run EAP
RUN yum -y install java-1.7.0-openjdk-devel maven3 unzip
RUN yum clean all


#RUN curl -k -o unzip-6.0-15.el7.x86_64.rpm -L ftp://ftp.pbone.net/mirror/ftp.scientificlinux.org/linux/scientific/7.2/x86_64/os/Packages/unzip-6.0-15.el7.x86_64.rpm && rpm -Uvh unzip-6.0-15.el7.x86_64.rpm
RUN curl -k -o sonar.zip -L https://sonarsource.bintray.com/Distribution/sonarqube/sonarqube-5.4.zip && unzip sonar && chmod -R 777 /sonarqube-5*/logs /sonarqube-5*/bin/linux-x86-64 /sonarqube-5*/temp /sonarqube-5*/data /sonarqube-5*/extensions /sonarqube-5*/web && rm sonar.zip
ADD sonar.properties /sonarqube-5*/conf/sonar.properties

EXPOSE 9000



#CMD /sonarqube-5*/bin/linux-x86-64/sonar.sh console


# Simple startup script to avoid some issues observed with container restart
#ADD myscript.sh /myscript.sh
#RUN chmod -v +x /myscript.sh
#CMD ["/myscript.sh"]
#RUN apt-get update && apt-get install -y curl unzip default-jre
