#!/bin/bash
#  export DO_API_TOKEN=
# cat  terraform.tfstate | jq '.modules[].resources[].primary.attributes | { ipv4_address, name}'
# cat  terraform.tfstate | jq --raw-output '.modules[].resources[].primary.attributes | { ipv4_address, name}| .[]'
echo '[master]' >ini
cat  terraform.tfstate |  jq --raw-output '.resources[].instances[] | (.attributes.name + " ansible_host=" + .attributes.ipv4_address)' | head -n 1 >>ini
echo '[nodes]' >>ini
cat  terraform.tfstate |  jq --raw-output '.resources[].instances[] | (.attributes.name + " ansible_host=" + .attributes.ipv4_address)' | tail -n +2 >>ini
