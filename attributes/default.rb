## mrepo default attributes
## 
## Based off the following
##   - https://github.com/dagwieers/mrepo/blob/master/config/mrepo-example.conf

## Packages
default[:mrepo][:packages] = %w{ createrepo yum-utils lftp rpm-build pax screen }

## Directories
default[:mrepo][:config][:srcdir] = '/var/mrepo'
default[:mrepo][:config][:wwwdir] = '/var/www/mrepo'
default[:mrepo][:config][:confdir] = '/etc/mrepo.conf.d'
default[:mrepo][:config][:cachedir] = nil             # '/var/mrepo/cache'

## Mail
default[:mrepo][:config][:mailto] = nil               # 'root@localhost'
default[:mrepo][:config][:mailfrom] = nil             # 'mrepo@hostname'
default[:mrepo][:config][:smtpserver] = nil           # 'localhost'
default[:mrepo][:config][:cron] = nil                 # 'daily' 'weekly' 'monthly'

## Proxy
default[:mrepo][:config][:no_proxy] = nil
default[:mrepo][:config][:ftp_proxy] = nil
default[:mrepo][:config][:http_proxy] = nil
default[:mrepo][:config][:https_proxy] = nil

## Sub process options
default[:mrepo][:config][:arch] = 'x86_64'
default[:mrepo][:config][:createrepo_options] = nil   # '-p'
default[:mrepo][:config][:reposync_cleanup] = nil     # 'yes'
default[:mrepo][:config][:reposync_newest_only] = nil # 'no'
default[:mrepo][:config][:reposync_options] = nil
default[:mrepo][:config][:repoview_options] = nil

## RHN
default[:mrepo][:config][:rhnlogin] = nil
default[:mrepo][:config][:rhnget_cleanup] = nil       # 'yes'
default[:mrepo][:config][:rhnget_download_all] = nil  # 'no'
default[:mrepo][:config][:rhnget_options] = nil

## HTTP
default[:mrepo][:config][:httpd_enabled] = true
default[:mrepo][:config][:httpd_vars][:DocumentRoot] = default[:mrepo][:config][:wwwdir] 
default[:mrepo][:config][:httpd_mods] = %w{
                                          actions alias auth_basic auth_digest authn_alias
                                          authn_anon authn_dbm authn_default authn_file
                                          authnz_ldap authz_dbm authz_default authz_groupfile
                                          authz_host authz_owner authz_user autoindex cache
                                          cgi dav_fs dav deflate dir disk_cache env expires
                                          ext_filter headers include info ldap log_config
                                          mime mime_magic negotiation proxy_ajp proxy_balancer
                                          proxy_connect proxy_ftp proxy_http proxy rewrite
                                          setenvif speling status substitute suexec userdir
                                          usertrack version vhost_alias
                                        }
