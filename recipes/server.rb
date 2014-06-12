#
# Cookbook Name:: gearman
# Recipe:: server
# URL:: http://github.com/rsumilang/chef-gearman
#
# Copyright 2014, Richard Sumilang <me@richardsumilang.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Cookbooks
include_recipe "apt"
include_recipe "build-essential"


# Required Packages
node['gearman']['required_packages'].each { |p|
  package p do
    action :install
  end
}


# Download remote file
remote_file "#{Chef::Config[:file_cache_path]}/gearmand-#{node['gearman']['version']}.tar.gz" do
  source "https://launchpad.net/gearmand/1.2/#{node['gearman']['version']}/+download/gearmand-#{node['gearman']['version']}.tar.gz"
  action :create_if_missing
end


# Compile downloaded file
bash "compile_gearman_source" do
  cwd Chef::Config[:file_cache_path]
  code <<-EOH
    tar zxf gearmand-#{node['gearman']['version']}.tar.gz
    cd gearmand-#{node['gearman']['version']}
    ./configure
    make && make install
    ldconfig
  EOH
  creates "/usr/local/bin/gearman"
  creates "/usr/local/bin/gearadmin"
end