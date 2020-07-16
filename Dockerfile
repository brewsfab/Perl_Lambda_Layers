FROM centos:latest

ENV MOUNTVOL /outfiles
RUN mkdir -p $MOUNTVOL
COPY fullinstall.sh /tmp
WORKDIR /tmp
RUN chmod 755 fullinstall.sh && ./fullinstall.sh

ENTRYPOINT ["/bin/bash"]
