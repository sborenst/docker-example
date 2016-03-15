FROM openshift3/rhel7


RUN yum -y update; yum clean all
RUN yum -y install httpd; yum clean all
RUN echo "Apache" >> /var/www/html/index.html

EXPOSE 80

# Simple startup script to avoid some issues observed with container restart
ADD myscript.sh /myscript.sh
RUN chmod -v +x /myscript.sh

CMD ["/myscript.sh"]
