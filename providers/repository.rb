
use_inline_resources if defined?(use_inline_resources)

def whyrun_supported?
  true
end

action :create do

  template "#{node[:mrepo][:config][:confdir]}/#{new_resource.repoid}.conf" do
    source 'repository.erb'
    action :create
    variables(:config => new_resource)
    cookbook 'mrepo'
  end

end

