FROM centos:latest

ENV SAVEDIR /outfiles
RUN mkdir -p $SAVEDIR
COPY fullinstall.sh /tmp
WORKDIR /tmp
RUN chmod 755 fullinstall.sh && ./fullinstall.sh

ENTRYPOINT ["/bin/bash"]
