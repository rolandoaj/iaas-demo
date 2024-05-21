iaas-demo
---------------------------------------------------------------------------------------------
This pack of code release an Apache EC2 instance, deploying the next infraestructure on aws:
    EC2: linux 2, t2.micro
    VPC: network 172.16.0.0/16
    EIP: public ip to reach apache url 
    Internet GW: route public petitions to EC2
    Security group: allow ssh and https traffic
    Elastic Block Storage: It'll be created two gp2 storages, 4gb each one
    Key pair: Certificates with RSA algorithm (4096 bits) to ssh conenctions with ansible

Variables
---------------------------------------------------------------------------------------------
Terraform variables
    REGION_AWS: us-east-1
    AV_ZONE: us-east-1a
    INSTA_TYPE: t2.micro
    AMI_SELECT: ami-0453898e98046c639
    SIZE_DISK: 4
AWS CLI
    AWS Access Key ID: your access key id generated on AMI
    AWS Secret Access key: your access jey generated on AMI

Requirements
---------------------------------------------------------------------------------------------
    - RHEL server version 8 or higher with internet access
    - Python3.10
    - Python3.10-venv
    - Python3-pip
    - Terraform 1.5.4 or higher
    - jq 1.6
    - awscli

Exampĺe 
---------------------------------------------------------------------------------------------
$ sudo yum install python3.10-venv && yum install python3-pip
$ sudo yum install -y yum-utils && sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo && sudo yum -y install terraform
$ curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"&& unzip awscliv2.zip && sudo ./aws/install
$ aws configure
AWS Access Key D [None]:
AWS Secret Access Key [None]:
$ ./start.sh