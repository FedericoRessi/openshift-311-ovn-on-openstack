# openshift connect POC

  The ansible playbooks in this repository is designed to spawn 3 hosts
on openstack, and then deploy OKD 3.11 on top.

  The main script is setup.sh, this script will use the setup-openshift-hosts.yml
ansible-playbook to prepare 3 hosts on openstack (tested on rdocloud), and
generate the openshift-ansible-inventory file.

  Then it will checkout openshift-ansible and deploy OKD 3.11 over the spawned
hosts.

  The topology is 1 master and 2 worker nodes.

  Then create-os-instances.yml will create 3 instances:
   - master
   - worker1
   - worker2

  create-os-instances.yml uses os_server to create the instances and
add_host to dynamically add those instances to the ansible inventory,
you can modify the static "inventory" file to add those hosts later,
for example if you want to only run parts of ansible with "--start-at-task",
because in this case, the "add_host" part will be skipped, and the
static inventory from "inventory" file will be used.

## pre-setup

* Copy cloud.yml.example to cloud.yml and edit your credentials to your cloud.
* Edit inventory file and set 'ssh_key' to the right value
* Edit ansible.cfg to point to your ssh key, if it's not the standard ~/.ssh/id_rsa or in your ssh agent
  by setting "private_key_file = /path/to/key"

## setup

```bash
./setup.sh
```

