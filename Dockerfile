FROM cloudpack/centos:0.0.0

RUN rpm -Uvh --nosignature http://nginx.org/packages/rhel/7/noarch/RPMS/nginx-release-rhel-7-0.el7.ngx.noarch.rpm
RUN yum -y update
RUN yum -y install nginx
RUN yum -y clean all

CMD /usr/sbin/nginx -g "daemon off;"

EXPOSE 80

VOLUME /etc/nginx
VOLUME /usr/share/nginx/html
VOLUME /var/log/nginx
