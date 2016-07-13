# File: provision.sh
#!/bin/bash

# Comment out for DEV.  Only use on PROD.
# yum update -y
curl --silent --location https://rpm.nodesource.com/setup_4.x | bash -
rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm
yum install -y nodejs rpmbuild git ruby ruby-devel gcc-c++ puppet vim
npm install -g grunt-cli bower gulp nodemon npm coffee-script
gem install sass r10k compass ceaser-easing

cd /vagrant/client && npm install
cd /vagrant/server && npm install
