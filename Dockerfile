FROM centos:centos7

RUN yum -y update

RUN rpm -Uvh http://nginx.org/packages/rhel/7/noarch/RPMS/nginx-release-rhel-7-0.el7.ngx.noarch.rpm
RUN yum -y install nginx

RUN yum -y clean all

CMD ["nginx", "-g", "daemon off;"]

EXPOSE 80
