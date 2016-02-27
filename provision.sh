# File: provision.sh
#!/bin/bash
curl -sL https://rpm.nodesource.com/setup_5.x | bash -
rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm
yum install -y nodejs rpmbuild git ruby puppet vim
npm install -g grunt-cli bower gulp pm2
gem install sass r10k
