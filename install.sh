#!/bin/bash
apt-get update && apt-get install -y python3 python3-pip unzip
python3 -m pip install boto3
python3 -m pip cache purge
apt-get clean
curl https://releases.hashicorp.com/packer/1.7.3/packer_1.7.3_linux_amd64.zip -o packer_1.7.3_linux_amd64.zip
unzip -o packer_1.7.3_linux_amd64.zip
mv packer /usr/local/bin/packer
chmod 755 /usr/local/bin/packer
rm -rf packer_1.7.3_linux_amd64.zip
curl https://omnitruck.chef.io/install.sh | bash -s -- -P inspec