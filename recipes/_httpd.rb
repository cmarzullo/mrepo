# Setup a web server
#


httpd_config 'mrepo' do
  source 'mrepo.httpd.conf.erb'
  action :create
  instance 'mrepo'
end

httpd_service 'mrepo' do
  servername 'localhost'
  action :create
  keepalive true
  instance 'mrepo'
  modules node[:mrepo][:config][:httpd_mods]
end
