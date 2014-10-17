# Setup a web server
#

httpd_service 'mrepo' do
  servername 'localhost'
  action :create
  keepalive true
end
