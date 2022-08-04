FROM registry.fedoraproject.org/fedora:latest

RUN dnf install -y httpd && \
    dnf clean all
    
EXPOSE 8080
EXPOSE 8443
    
COPY exec-httpd /usr/bin/exec-httpd
COPY index.html /var/www/html/index.html
    
USER 1001

CMD ["/usr/bin/exec-httpd"]
