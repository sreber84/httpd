FROM registry.fedoraproject.org/fedora:latest

RUN dnf install -y httpd && \
    dnf clean all
    
EXPOSE 8080
EXPOSE 8443
    
COPY exec-httpd /usr/bin/exec-httpd
COPY index.html /var/www/html/index.html

RUN sed -i -e 's/^Listen 80/Listen 0.0.0.0:8080/' /etc/httpd/conf/httpd.conf
RUN sed -i -e '151s%AllowOverride None%AllowOverride All%' /etc/httpd/conf/httpd.conf

RUN chmod 755 /usr/bin/exec-httpd
    
USER 1001

CMD ["/usr/bin/exec-httpd"]
