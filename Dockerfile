FROM centos:lastest
MAINTAINER codex page

RUN yum update -y
RUN yum install -y openssh-server
RUN mkdir /var/run/sshd

RUN echo 'root:root' | chpasswd

RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

RUN mkdir /root/.ssh

EXPOSE 22

RUN    /usr/bin/ssh-keygen -A
CMD    ["/usr/sbin/sshd", "-D"]
