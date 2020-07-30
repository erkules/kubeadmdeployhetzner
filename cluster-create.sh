#!/bin/bash
terraform apply  -auto-approve
sleep 15
bash ./state-extractor.sh 
ansible-playbook -i ini  -e 'ansible_python_interpreter=/usr/bin/python3' -u root all.yml
test -a all.retry && ansible-playbook -i ini   -e 'ansible_python_interpreter=/usr/bin/python3' -u root all.yml --limit @all.retry

