FROM registry.fedoraproject.org/fedora:latest

RUN dnf install -y httpd && \
    dnf clean all
    
COPY exec-httpd /usr/bin/exec-httpd
    
USER 1001

CMD ["/usr/bin/exec-httpd"]
