# README

    docker-compose build
    docker-compose run ansible

    ssh-keygen -t ed25519 -N '' -f $HOME/.ssh/id_ed25519


## Setup a new Photon VM from an OVA

First we need to add the hostkeys to our `known_hosts` file and set an initial password.

    IP=10.11.12.99
    NEW_HOSTNAME=k8s-master01
    ssh $IP

Default password is `changeme`, temporarily set it to anything. It will be scrambled by the playbook in the next step.

    ansible all -i $IP, -m ping --ask-pass

    ansible-playbook --inventory $IP, --extra-vars hostname=$NEW_HOSTNAME --ask-pass ~/playbooks/photon-firstrun.yml

## Update the hosts.yml file check that everyone is responding

    ansible all -m ping

## Run the Playbook

    ansible-playbook ~/playbooks/kubernetes.yml

## Notes

I was hoping the Photon Ansible patch would work, but I couldn't figure out how to use their
version of the `tdnf` module. https://github.com/vmware/photon/issues/1245

Here's a scratchpad from my attempts to build their patched ansible.

    RUN tdnf install -y rpm-build git
    RUN git clone https://github.com/vmware/photon.git --depth 1 --branch master --single-branch vmware-photon
    RUN mkdir -p ~/rpmbuild/{BUILD,RPMS,SOURCES,SPECS,SRPMS}
    RUN echo '%_topdir %(echo $HOME)/rpmbuild' > ~/.rpmmacros
    https://packages.vmware.com/photon/3.0/photon_srpms_3.0_x86_64/BUILD%20and%20INSTALL.txt
