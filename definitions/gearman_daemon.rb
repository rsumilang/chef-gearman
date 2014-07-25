#
# Cookbook Name:: gearman
# Definition:: gearman_daemon
# URL:: http://github.com/rsumilang/chef-gearman
#
# Copyright 2014, Richard Sumilang
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



# Install required daemon package
package 'daemon' do
  action :install
end



define :gearman_daemon, :user => 'root', :retries => 5, :port => 4730, :enabled => true do

  daemon_name = params[:name]
  cookbook = params[:cookbook] ? params[:cookbook] : 'gearman'

  # Install lsb daemon script
  template "/etc/init.d/#{daemon_name}" do
    source   'lsb_daemon.erb'
    owner    'root'
    group    'root'
    mode     '0744'
    cookbook cookbook
    variables(
        :daemon_name  => daemon_name,
        :user         => params[:user],
        :retries      => params[:retries],
        :port         => params[:port]
    )
  end

  # Start daemon by default
  if params[:enabled]
    bash "#{daemon_name}-rc-d" do
      code <<-EOH
        update-rc.d #{daemon_name} defaults
        service #{daemon_name} start
      EOH
    end
  end

end