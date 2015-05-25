FROM cloudpack/centos

RUN rpm -Uvh --nosignature http://nginx.org/packages/rhel/7/noarch/RPMS/nginx-release-rhel-7-0.el7.ngx.noarch.rpm
RUN yum -y update
RUN yum -y install nginx
RUN yum -y clean all

RUN ls -sf /dev/stdout /var/log/nginx/access.log
RUN ls -sf /dev/stderr /var/log/nginx/error.log

VOLUME /etc/nginx
RUN cp -rfp /etc/nginx /etc/nginx-org
VOLUME /usr/share/nginx/html
RUN cp -rfp /usr/share/nginx/html /usr/share/nginx/html-org

EXPOSE 80
CMD test -z "$(ls -A /etc/nginx)" && cp -rfp /etc/nginx-org/* /etc/nginx ;\
    test -z "$(ls -A /usr/share/nginx/html)" && cp -rfp /usr/share/nginx/html-org/* /usr/share/nginx/html ;\
    /usr/sbin/nginx -g "daemon off;"
