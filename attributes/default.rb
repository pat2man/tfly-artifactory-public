#
# Cookbook Name:: tfly-artifactory
# Attributes:: default
#
# Copyright (C) 2015 Ticketfly, Inc.
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

default['tfly-artifactory']['version'] = "4.5.2"
default['tfly-artifactory']['repo'] = "jfrog-docker-reg2.bintray.io/jfrog/artifactory-pro"
default['tfly-artifactory']['home'] = "/var/opt/jfrog/artifactory"
