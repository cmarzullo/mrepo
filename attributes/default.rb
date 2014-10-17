default[:mrepo][:packages] = %w{ mrepo createrepo yum-utils lftp }
default[:mrepo][:config][:srcdir] = '/var/mrepo'
default[:mrepo][:config][:wwwdir] = '/var/www/mrepo'
default[:mrepo][:config][:confdir] = '/etc/mrepo.conf.d'

default[:mrepo][:config][:mailto] = 'root@localhost'
default[:mrepo][:config][:smtpserver] = 'localhost'
default[:mrepo][:config][:cron] = nil
default[:mrepo][:config][:httpd_enabled] = true

