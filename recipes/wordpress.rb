#
# Cookbook Name:: demo
# Recipe:: wordpress
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


directory "/var/www/#{node['demo']['site_url']}/htdocs" do
	owner 'root'
	group 'root'
	mode '0755'
	recursive true
	action :create
end

directory "/var/www/#{node['demo']['site_url']}/logs" do
	owner 'root'
	group 'root'
	mode '0755'
	recursive true
	action :create
end

remote_file "/var/www/#{node['demo']['site_url']}/htdocs/latest.tar.gz" do
	source 'http://wordpress.org/latest.tar.gz'
	owner 'root'
	group 'root'
	mode '0755'
	action :create
end

bash 'extract_wp_files' do
	cwd "/var/www/#{node['demo']['site_url']}/htdocs"
	code "tar --strip-components=1 -xvf latest.tar.gz && rm latest.tar.gz && chown -R www-data:www-data /var/www/#{node['demo']['site_url']}"
end

#Need the DB password!
password_secret = Chef::EncryptedDataBagItem.load_secret(node['demo']['secret_file'])
password_data_bag_item = Chef::EncryptedDataBagItem.load('database_passwords', 'mysql_db', password_secret)

execute 'create_wp_db' do
	command "mysql -u root -p#{password_data_bag_item['root_password']} -e 'CREATE DATABASE IF NOT EXISTS #{node['demo']['db_name']};'"
end

template "/etc/nginx/sites-available/#{node['demo']['site_url']}" do
	source 'demo.erb'
	owner 'root'
	group 'root'
	mode '0755'
end

link "/etc/nginx/sites-enabled/#{node['demo']['site_url']}" do
	to "/etc/nginx/sites-available/#{node['demo']['site_url']}"
end

execute 'reload_nginx_config' do
	command 'service nginx reload'
end
