FROM centos:7

# Install dependencies
RUN yum install -y telnet-server ncurses

RUN groupadd dglaunch
RUN useradd -g dglaunch dglaunch
#USER dglaunch

# Mount runtime
VOLUME /root

CMD ["/root/pinetd.py"]
#CMD ["/bin/bash"]
