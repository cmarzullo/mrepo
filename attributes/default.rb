default[:mrepo][:packages] = %w{ mrepo createrepo yum-utils lftp }
default[:mrepo][:config][:srcdir] = '/var/mrepo'
default[:mrepo][:config][:wwwdir] = '/var/www/mrepo'
default[:mrepo][:config][:confdir] = '/etc/mrepo.conf.d'

default[:mrepo][:config][:mailto] = 'root@localhost'
default[:mrepo][:config][:smtpserver] = 'localhost'
default[:mrepo][:config][:cron] = nil
default[:mrepo][:config][:httpd_enabled] = true

# These are the default mods under CentOS
default[:mrepo][:config][:httpd_vars][:DocumentRoot] = default[:mrepo][:config][:wwwdir] 
default[:mrepo][:config][:httpd_mods] = %w{
                                          actions alias auth_basic auth_digest authn_alias
                                          authn_anon authn_dbm authn_default authn_file
                                          authnz_ldap authz_dbm authz_default authz_groupfile
                                          authz_host authz_owner authz_user autoindex cache
                                          cgi dav_fs dav deflate dir disk_cache env expires
                                          ext_filter headers include info ldap log_config logio
                                          mime mime_magic negotiation proxy_ajp proxy_balancer
                                          proxy_connect proxy_ftp proxy_http proxy rewrite
                                          setenvif speling status substitute suexec userdir
                                          usertrack version vhost_alias
                                        }
