# File: provision.sh
#!/bin/bash
sudo curl -sL https://rpm.nodesource.com/setup_5.x | bash -
sudo yum install -y nodejs rpmbuild git ruby ruby-devel mariadb-server mariadb ImageMagick vim
sudo npm install -g grunt-cli bower
sudo gem install compass zurb-foundation
