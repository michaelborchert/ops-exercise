#
# Cookbook Name:: demo
# Recipe:: mysqld
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'mysqld::mysql_install'
include_recipe 'mysqld::configure'

