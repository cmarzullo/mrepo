## mrepo::_build
## Purpose: Build mrepo and make rpm from source

## Download
git "#{Chef::Config[:file_cache_path]}/mrepo-master" do
  repository 'https://github.com/dagwieers/mrepo.git'
  notifies :run, 'execute[mrepo_build]', :immediately
end

## Build
execute 'mrepo_build' do
  command 'make rpm'
  cwd "#{Chef::Config[:file_cache_path]}/mrepo-master"
  action :nothing
end

## Install
# TODO: These version numbers shouldn't be hardcoded.
package 'mrepo' do
  action :install
  source "#{Chef::Config[:file_cache_path]}/mrepo-0.8.8-1.noarch.rpm"
  notifies :write, 'log[mrepo_installed]', :immediately
end

log 'mrepo_installed' do
  action :nothing
  message "package[mrepo] installing from mrepo-0.8.8-1 from #{Chef::Config[:file_cache_path]}"
end

