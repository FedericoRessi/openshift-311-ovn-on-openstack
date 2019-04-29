#!/bin/sh
set -x
set -e

if [ -d .tmp/facts_cache ]; then
   rm -rf .tmp/facts_cache
fi

ansible-playbook setup-openshift-hosts.yml

if [ ! -d openshift-ansible ]; then
  git clone https://github.com/openshift/openshift-ansible
  cd openshift-ansible
  git checkout release-3.11
  cd ..
fi

cd openshift-ansible

ansible-playbook -i ../openshift-ansible-inventory  playbooks/prerequisites.yml
ansible-playbook -i ../openshift-ansible-inventory  playbooks/deploy_cluster.yml

