# Basics

![Ansible Architecture](images/ansible-architecture.png)

To get acquainted with ansible, Set up a development environment similar to 
the image just above. Create 3 VMs with virtualBox: one controlling 
machine running ansible and containing required files, two servers. Make sure OpenSSH is installed to allow ssh connection. Also use Bridged adaptors so that, 
VMs will be allocated with IPs in the same network than your host machine.

![Ansible Node](images/ansible-node.png)

Make sure to ssh servers from the controlling machine.

First of all ssh in the controlling machine using password. Then from there, ssh
into servers using also password.  
Next, Create ssh key (using ed25519):  
`ssh-keygen -t ed25519 -C "username"`  
Add the secret key to the ssh agent:  
`eval $(ssh-agent -s) && ssh-add ~/.ssh/id_ed25519`   
Copy the public key into servers (nodes)  
`ssh-copy-id -i ~/.ssh/id_ed25519.pub 192.168.0.122`  
Finally, ssh into server without password.

![SSH Connection](images/ssh-connection.png)

## Ansible Ad Hoc commands

![Ansible Adhoc](images/ansible-adhoc.png)

## Running elevated ad-hoc commands

![Elevated Ad-hoc](images/elevated-adhoc.png)

## Playbook

![Playbook](images/playbook.png)