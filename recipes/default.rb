# Cookbooks
include_recipe "apt"
include_recipe "build-essential"

# Packages
require_packages = ["libboost-all-dev", "libevent-dev", "libcurl4-openssl-dev", "libcloog-ppl0"]
require_packages.each { |p|
  package p do
    action :install
  end
}


# user node[:gearman][:user] do
#   action :create
#   system true
#   shell "/bin/false"
# end
#
# directory node[:gearman][:dir] do
#   owner "root"
#   mode "0755"
#   action :create
# end
#
# directory node[:gearman][:data_dir] do
#   owner "gearman"
#   mode "0755"
#   action :create
# end
#
# directory node[:gearman][:log_dir] do
#   mode 0755
#   owner node[:gearman][:user]
#   action :create
# end

remote_file "#{Chef::Config[:file_cache_path]}/gearmand-1.1.5.tar.gz" do
  source "https://launchpad.net/gearmand/1.2/1.1.5/+download/gearmand-1.1.5.tar.gz"
  action :create_if_missing
end

bash "compile_gearman_source" do
  cwd Chef::Config[:file_cache_path]
  code <<-EOH
    tar zxf gearmand-1.1.5.tar.gz
    cd gearmand-1.1.5
    ./configure
    make && make install
    ldconfig
  EOH
  creates "/usr/local/bin/gearman"
  creates "/usr/local/bin/gearadmin"
end

# service "gearman" do
#   provider Chef::Provider::Service::Upstart
#   subscribes :restart, resources(:bash => "compile_gearman_source")
#   supports :restart => true, :start => true, :stop => true
# end
#
# template "gearman.conf" do
#   path "#{node[:gearman][:dir]}/gearman.conf"
#   source "gearman.conf.erb"
#   owner "root"
#   group "root"
#   mode "0644"
#   notifies :restart, resources(:service => "gearman")
# end
#
# template "gearman.upstart.conf" do
#   path "/etc/init/gearman.conf"
#   source "gearman.upstart.conf.erb"
#   owner "root"
#   group "root"
#   mode "0644"
#   notifies :restart, resources(:service => "gearman")
# end
#
# service "gearman" do
#   action [:enable, :start]
# end