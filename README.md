#

 ~~~
 terraform apply 
 bash state-extractor.sh 
 ansible-playbook -i ini  -e 'ansible_python_interpreter=/usr/bin/python3' -u root all.yml
 ~~~

CNI:

In  group_vars/all kann 
cni: calico
oder 
cni: weave 
gesetzt werden
