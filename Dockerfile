FROM centos:latest

RUN dnf -y install dnf install glibc-langpack-en
RUN yum -y update && yum clean all
RUN yum -y groupinstall "Development Tools"

WORKDIR /tmp

RUN curl https://downloads.activestate.com/ActivePerl/releases/5.24.3.2404/ActivePerl-5.24.3.2404-x86_64-linux-glibc-2.15-404865.tar.gz -O

RUN tar -xf ActivePerl-5.24.3.2404-x86_64-linux-glibc-2.15-404865.tar.gz

WORKDIR ActivePerl-5.24.3.2404-x86_64-linux-glibc-2.15-404865

ENTRYPOINT ["/bin/bash"]
