#
# Cookbook Name:: demo
# Recipe:: nginx
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

package 'nginx' do
	action :install
end

service 'nginx' do
	action [:enable, :start]
end
