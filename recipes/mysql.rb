#
# Cookbook Name:: demo
# Recipe:: mysql
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

password_secret = Chef::EncryptedDataBagItem.load_secret(node['demo']['secret_file'])
password_data_bag_item = Chef::EncryptedDataBagItem.load('database_password', 'mysql_db', password_secret')

mysql_service 'db' do
	port '3306'
	version '5.5'
	initial_root_password password_data_bag_item['root_password']
	action [:create, :start]
end
