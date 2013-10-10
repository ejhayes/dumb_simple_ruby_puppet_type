#!/usr/bin/env bash

# Install latest version of puppet
# and any other gems deemed necessary
# for this example

# Where is stuff located?
PUPPET_DIR=/etc/puppet
VAGRANT_HOME=/home/vagrant
VAGRANT_SHARED=/vagrant
PUPPET_PACKAGING_DIR=$VAGRANT_SHARED/packaging/vagrant

# Useful commands we use
PUPPET_MODULE_NAME=recordsproject
RUN_PUPPET=$VAGRANT_HOME/run_puppet
BOOTSTRAP=$PUPPET_PACKAGING_DIR/manifests/bootstrap.pp

# Ubuntu puppet repositories are not up to date
echo '############ ADDING OFFICIAL PUPPET REPOSITORY ############'
wget http://apt.puppetlabs.com/puppetlabs-release-precise.deb
dpkg -i puppetlabs-release-precise.deb

# Install base bootstrapping dependencies
echo '############ INSTALLING BASE DEPENDENCIES ############'
apt-get update
apt-get -y install git curl puppet

## Install ruby 1.9.3
echo '############ INSTALLING RVM AND RUBY ############'
\curl -L https://get.rvm.io --progress-bar | bash -s stable
source /etc/profile.d/rvm.sh
rvm requirements 2>&1
rvm install 1.9.3-p448 2>&1
rvm use 1.9.3-p448 --default

# Install bundler since it is needed
echo '############ INSTALLING BUNDLER ############'
gem install bundler --no-ri --no-rdoc
