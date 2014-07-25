#
# Cookbook Name:: gearman
# Definition:: gearman_worker
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

define :gearman_worker, :acceptable => 50, :output_file => '/var/log/gearman-worker.log', :command => '', :enabled => true do

  worker_name = params[:name]
  cookbook = params[:cookbook] ? params[:cookbook] : 'gearman'

  # Install lsb worker script
  template "/etc/init.d/#{worker_name}" do
    source   'lsb_worker.erb'
    owner    'root'
    group    'root'
    mode     '0744'
    cookbook cookbook
    variables(
        :worker_name  => worker_name,
        :acceptable   => params[:acceptable],
        :output_file  => params[:output_file],
        :command      => params[:command]
    )
  end

  # Start worker by default
  if params[:enabled]
    bash "#{worker_name}-rc-d" do
      code <<-EOH
        update-rc.d #{worker_name} defaults
        service #{worker_name} start
      EOH
    end
  end

end