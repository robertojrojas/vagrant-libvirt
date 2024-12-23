#!/bin/bash


# This script is a work-around for the following issue: 
#  https://github.com/vagrant-libvirt/vagrant-libvirt/issues/1833
#
#  I added this shell script to my $PATH so I can run it from any directory.
#
# Arch Linux:
#  - sudo pacman -S ruby
#  - Install yay (https://github.com/Jguer/yay?tab=readme-ov-file#installation)
#  - yay -S ruby-excon
#  - gem install bundler # installs it locally so add ${HOME}/.local/share/gem/ruby/3.3.0/bin to $PATH
#
# The following is a modified version of the Development instructions from 
#   https://github.com/robertojrojas/vagrant-libvirt?tab=readme-ov-file#development
#
# Before running this script:
#
# cd vagrant-libvirt
# export VAGRANT_VERSION=v2.4.3
# bundle config --local with vagrant-v0.12.2
# bundle config --local path 'vendor/bundle'
# bundle install

# In case your Bundler gem is installed locally
# export PATH=${HOME}/.local/share/gem/ruby/3.3.0/bin:$PATH
export VAGRANT_VERSION=${VAGRANT_VERSION:-v2.4.3}
export VAGRANT_DEFAULT_PROVIDER=libvirt
export VAGRANT_CWD=${PWD}
export VAGRANT_VAGRANTFILE=${PWD}/Vagrantfile

VAGRANT_CMD=${1:-version}
export VAGRANT_LIBVIRT_PLUGIN_DIR=${HOME}/vagrant-libvirt
pushd ${VAGRANT_LIBVIRT_PLUGIN_DIR}
bundle exec vagrant $@
popd

# within your vagrant VM (where the Vagrantfile is) directory run:
# vagrant_libvirt.sh up

