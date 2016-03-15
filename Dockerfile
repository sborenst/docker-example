FROM registry.access.redhat.com/rhel7

#RUN yum -y update; yum clean all
#RUN yum -y install httpd; yum clean all
#RUN echo "Apache" >> /var/www/html/index.html
RUN curl -k -o unzip-6.0-15.el7.x86_64.rpm -L ftp://ftp.pbone.net/mirror/ftp.scientificlinux.org/linux/scientific/7.2/x86_64/os/Packages/unzip-6.0-15.el7.x86_64.rpm && rpm -Uvh unzip-6.0-15.el7.x86_64.rpm

RUN curl -k -o sonar.zip -L https://sonarsource.bintray.com/Distribution/sonarqube/sonarqube-5.4.zip && unzip sonar && chmod -R 777 /sonarqube-5*/logs /sonarqube-5*/bin/linux-x86-64 /sonarqube-5*/temp /sonarqube-5*/data /sonarqube-5*/extensions /sonarqube-5*/web && rm sonar.zip
ADD sonar.properties /sonarqube-5*/conf/sonar.properties

EXPOSE 9000


CMD /sonarqube-5*/bin/linux-x86-64/sonar.sh console

