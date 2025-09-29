FROM ubuntu:20.04

# تثبيت OpenSSH و WebSocket
RUN apt-get update && apt-get install -y openssh-server python3 python3-pip
RUN pip3 install websockify

# إعداد SSH
RUN mkdir /var/run/sshd
RUN echo 'root:123456' | chpasswd  # كلمة السر root = 123456
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# المنفذ
EXPOSE 22 80

# تشغيل SSH + WebSocket
CMD service ssh start && websockify 0.0.0.0:80 localhost:22
