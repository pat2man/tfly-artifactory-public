#
# Cookbook Name:: tfly-artifactory
# Recipe:: default
#
# Copyright (C) 2015 Ticketfly LLC.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

docker_service 'default' do
  action [:create, :start]
end

docker_image "#{node['tfly-artifactory']['repo']}" do
  tag node['tfly-artifactory']['version']
  action :pull
end

['data', 'logs', 'backup', 'etc'].each do |directory_name|
  directory "#{node['tfly-artifactory']['home']}/#{directory_name}" do
    mode '777'
    recursive true
  end
end

template "#{node['tfly-artifactory']['home']}/etc/default" do
  mode '666'
end

template "#{node['tfly-artifactory']['home']}/etc/artifactory.config.xml" do
  mode '666'
  not_if { File.exists?("#{node['tfly-artifactory']['home']}/etc/artifactory.config.latest.xml") }
end

cookbook_file "#{node['tfly-artifactory']['home']}/etc/artifactory.system.properties" do
  mode '666'
  action :create_if_missing
end

cookbook_file "#{node['tfly-artifactory']['home']}/etc/logback.xml" do
  mode '666'
  action :create_if_missing
end

cookbook_file "#{node['tfly-artifactory']['home']}/etc/mimetypes.xml" do
  mode '666'
  action :create_if_missing
end

if ! node['tfly-artifactory']['license'].nil?
  file "#{node['tfly-artifactory']['home']}/etc/artifactory.lic" do
    content node['tfly-artifactory']['license']
    mode '666'
    action :create_if_missing
  end
end

docker_container 'artifactory' do
  repo node['tfly-artifactory']['repo']
  tag node['tfly-artifactory']['version']
  port ['80:80', '8081:8081', '443:443', '5000-5002:5000-5002']
  restart_policy 'always'
  env [
    "ARTIFACTORY_HOME=#{node['tfly-artifactory']['home']}"
  ]
  volumes [
    "#{node['tfly-artifactory']['home']}/data:#{node['tfly-artifactory']['home']}/data",
    "#{node['tfly-artifactory']['home']}/logs:#{node['tfly-artifactory']['home']}/logs",
    "#{node['tfly-artifactory']['home']}/etc:#{node['tfly-artifactory']['home']}/etc",
    "#{node['tfly-artifactory']['home']}/backup:#{node['tfly-artifactory']['home']}/backup"
  ]
end
