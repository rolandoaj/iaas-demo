#!/bin/bash 

##función para desplegarnos la url para consultar el servicio apache un avez terminado la instalación 
url_out(){ 
    sal=$(jq '.outputs.server_public_ipv4.value' terraform/terraform.tfstate) 
    sal2=$(echo "${sal%?}") 
    sal3=$(echo "${sal2#?}") 
    port=":443" 
    protocol="https://" 
    gurl="$protocol$sal3$port" 
    echo "" 
    echo "" 
    echo " ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓" 
    echo " ▓▒░       Your Apache url is:                            ░▒▓" 
    echo " ▓ ▓" 
    echo " $gurl" 
    echo "" 
    echo "" 
    echo "" 
} 

##función para crear el ambiente virtual 
kvenv(){ 
    python3 -m venv env 
    source env/bin/activate 
} 

##función para instalar ansible y dependencias de los roles 
install_dependencies(){ 
    echo "Installing ansible" 
    pip3 install ansible-core 
    echo "" 
    echo "" 
    echo "Installing terraform" 
    pip3 install terraform-compliance 
    echo "" 
    echo "" 
    echo "Installing aws pluging" 
    pip3 install boto3 botocore 
    echo "" 
    echo "" 
    echo "Installing galaxy dependecies" 
    ansible-galaxy collection install community.crypto 
    ansible-galaxy collection install amazon.aws 
    ansible-galaxy collection install community.general 
    ansible-galaxy collection install ansible.posix 
} 

mkvenv 
install_dependencies 
terraform -chdir=terraform/ init 
terraform -chdir=terraform/ apply -auto-approve 
cp terraform/apache-key-pair. 
chmod 400 apache-key-pair 
ansible-playbook install-apache.yml  
url_out 