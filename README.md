#

Bitte den Token für Hetzner in terraform.tfvars setzen.
In der maion.tf wird ein ssh-key referenziert, welches auf ein/das eigene SSH-Key verweisen soll.

Dann folgende Befehle (oder cluster-create.sh) ausführen.


 ~~~
 terraform apply 
 bash state-extractor.sh 
 ansible-playbook -i ini  -e 'ansible_python_interpreter=/usr/bin/python3' -u root all.yml
 ~~~
