FROM centos:centos7

RUN yum -y update
RUN yum search nginx
