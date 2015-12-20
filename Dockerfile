FROM centos:7

# Install dependencies
RUN yum install -y docker make gcc libncurses5-dev flex bison
RUN yum install -y ncurses-devel
RUN yum install -y autoconf
RUN yum install -y telnet-server

RUN groupadd dglaunch
RUN useradd -g dglaunch dglaunch
#USER dglaunch

# Mount sources
VOLUME /src
# Mount output
VOLUME /root

CMD ["/src/build.sh"]
