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
