#!/bin/bash
set -e

echo "Generating Ansible inventory..."

cd terraform

IPS=$(terraform output -json web_ips | jq -r '.[]')

cd ..

mkdir -p ansible/inventory

echo "[web]" > ansible/inventory/hosts.ini

for ip in $IPS
do
  echo "$ip ansible_user=root" >> ansible/inventory/hosts.ini
done

echo "Inventory created:"
cat ansible/inventory/hosts.ini