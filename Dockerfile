FROM centos:centos7

RUN yum -y update
RUN yum -y install nginx
