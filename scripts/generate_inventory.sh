#!/bin/bash

cd terraform
IPS=$(terraform output -json web_ips | jq -r '.[]')

echo "[web]" > ../ansible/inventory/hosts.ini

for ip in $IPS
do
  echo "$ip ansible_user=root" >> ../ansible/inventory/hosts.ini
done
