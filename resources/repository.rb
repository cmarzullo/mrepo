actions :create, :delete
default_action :create

attribute :arch, :kind_of => String, :default => 'x86_64'
attribute :desc, :kind_of => String, :default => 'My First Repo'
attribute :iso, :kind_of => String, :default => nil
attribute :metadata, :kind_of => String, :default => 'repomd'
attribute :release, :kind_of => String
attribute :repoid, :kind_of => String, :name_attribute => true
attribute :shareiso, :kind_of => [TrueClass, FalseClass], :default => nil
attribute :sources, :kind_of => Hash

attr_accessor :exists
