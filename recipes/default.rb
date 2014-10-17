#
# Cookbook Name:: mrepo
# Recipe:: default
#
# Copyright (C) 2014 Christopher Marzullo
#
# All rights reserved - Do Not Redistribute
#

node[:mrepo][:packages].each do |p|
  package p do
    action :install
  end
end

template '/etc/mrepo.conf' do
  source 'mrepo.conf.erb'
  action :create
  notifies :reload, "service[mrepo]", :delayed
end

# Create cron entry
# TODO: Needs to be able to be changed and detect other crons and delete
unless node[:mrepo][:config][:cron].nil?
  if %w{ hourly daily weekly monthly }.include? node[:mrepo][:config][:cron]
    template "/etc/cron.#{node[:mrepo][:config][:cron]}/mrepo" do
      source 'cron-run.erb'
      action :create
    end
  else
    log "Mrepo: #{node[:mrepo][:config][:cron]} invalid cron."
  end
end

template '/etc/logrotate.d/mrepo' do
  source 'mrepo.logrotate.erb'
  action :create
end

service 'mrepo' do
  supports :status => false, :restart => true, :start => true, :stop => true, :reload => true
  action [:enable, :start]
end

include_recipe 'mrepo::_httpd' if node[:mrepo][:config][:httpd_enabled]

