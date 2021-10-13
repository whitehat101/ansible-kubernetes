FROM photon:4.0
WORKDIR /root
RUN tdnf update
RUN tdnf install -y ansible openssh-clients sshpass
