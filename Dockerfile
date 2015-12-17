FROM centos:7

# Install dependencies
RUN yum install -y docker make gcc libncurses5-dev flex bison
RUN yum install -y ncurses-devel
RUN yum install -y autoconf

# Mount sources
VOLUME /src
# Mount output
VOLUME /root

CMD ["/bin/bash"]
