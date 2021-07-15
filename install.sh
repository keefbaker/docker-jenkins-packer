#!/bin/bash
apt-get update && apt-get install -y python3 python3-pip unzip
python3 -m pip install boto3
apt-get clean
curl https://releases.hashicorp.com/packer/1.7.3/packer_1.7.3_linux_amd64.zip -o packer_1.7.3_linux_amd64.zip
unzip -o packer_1.7.3_linux_amd64.zip
chmod 755 packer
rm -rf packer_1.7.3_linux_amd64.zip
curl https://omnitruck.chef.io/install.sh | bash -s -- -P inspec