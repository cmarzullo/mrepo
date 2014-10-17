# mrepo-cookbook

The mrepo cookbook will set up mrepo. http://dag.wiee.rs/home-made/mrepo/
The goal is to try and mimic the opscode yum cookbook. The cookbook exposes
a `mrepo_repository` resource that allows a user to make individual Yum 
repositories available for use. The goal is to support all the options mrepo
supports in `mrepo.conf`

## Supported Platforms

This has only been tested with Centos 6.5. This cookbook uses the version of
mrepo from the epel repo. That version is slightly behind the version available.
That version doesn't support reposync. Using reposync seems like a good way to do
mirrors.

This cookbook was written with Chef version 11.16.4

### Issues

This cookbook doesn't setup the http server correctly. It's a small thing I'm
sure, but might be moving on. Pull requests are welcome!

## Attributes

### mrepo::default

* `:srcdir` - Where to store all the downloaded files. String
* `:wwwdir` - Where to create all the symlinks for serving. String
* `:confdir` - Repo configuration director. String
* `:mailto` - Who gets the message. String
* `:smtpserver` - Who sends the message. String
* `:cron` - Can be a string with daily, weekly, or hourly.
* `:httpd_enabled` - This probably does something. Boolean

### mrepo_repository

* `:arch` - String for the architecures you want
* `:desc` - A description of the repo
* `:iso` - Path to the iso files
* `:metadata` - Why metadata formats you want
* `:release` - What release you want
* `:repoid` - What yo will name the repo
* `:shareiso` - Will you share the iso?
* `:sources` - This is a hash of the repo name and the uri

## Usage

### mrepo::default

Include `mrepo` in your node's `run_list` to install with defaults:

```json
{
  "run_list": [
    "recipe[mrepo::default]"
  ]
}
```

Or include it from another recipe

```ruby
include_recipe 'mrepo'
```

### mrepo_repository provider

This resource manages an mrepo configuration file that gets placed in 
`/etc/mrepo.conf.d` This is the file that will configure your remote
repositories. Only the :create action is supported

``` ruby
mrepo_repository 'centos6' do
  action :create
  desc 'CentOS 6.5 x86_64'
  release '6.5'
  arch 'x86_64'
  metadata 'repomd repoview'
  iso '/isopath/CentOS-6.5-x86_64-bin-DVD?.iso'
  shareiso true
  sources :updates => 'http://mirror/centos/6.5/updates/x86_64/',
          :extras  => 'http://mirror/centos/6.5/extras/x86_64/',
          :SCL     => 'http://mirror/centos/6.5/SCL/x86_64/'
end

```

## License and Authors

Author:: Christopher Marzullo (sevenmanin@gmail.com)
