FROM photon:4.0
RUN tdnf update
RUN tdnf install -y ansible openssh-clients sshpass

# Add the Ansible tdnf module
WORKDIR /usr/share/ansible/plugins/modules
RUN curl https://raw.githubusercontent.com/vmware/photon/master/SPECS/ansible/ansible-tdnf.patch | patch

WORKDIR /root
