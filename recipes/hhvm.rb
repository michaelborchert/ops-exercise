#
# Cookbook Name:: demo
# Recipe:: hhvm
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'hhvm::default'

execute 'hhvm_fastcgi' do
  command 'sudo /usr/share/hhvm/install_fastcgi.sh'
end
