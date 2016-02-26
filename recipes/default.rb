#
# Cookbook Name:: demo
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'apt::default'
include_recipe 'demo::mysqld'
include_recipe 'demo::nginx'
include_recipe 'demo::hhvm'
include_recipe 'demo::wordpress'
