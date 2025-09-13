export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

ansible-galaxy install -r ansible/requirements.yml
ansible-playbook ansible/playbooks/main.yml --ask-become-pass

