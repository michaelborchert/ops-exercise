#
# Cookbook Name:: demo
# Recipe:: mysqld
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'mysqld::mysql_install'
include_recipe 'mysqld::configure'

password_secret = Chef::EncryptedDataBagItem.load_secret(node['demo']['secret_file'])
password_data_bag_item = Chef::EncryptedDataBagItem.load('database_passwords', 'mysql_db', password_secret)

mysqld_password 'root' do
  password password_data_bag_item['root_password']
end

