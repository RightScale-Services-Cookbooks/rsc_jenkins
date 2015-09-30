user 'jenkins-slave' do
  home '/mnt/ephemeral/jenkins-slave'
  shell '/bin/bash'
  comment 'Jenkins Slave User'
  action :create
end

directory '/mnt/ephemeral/jenkins-slave' do
  owner 'jenkins-slave'
  group 'jenkins-slave'
  mode '0700'
  recursive true
  action :create
end

directory '/mnt/ephemeral/jenkins-slave/.ssh' do
  owner 'jenkins-slave'
  group 'jenkins-slave'
  mode '0755'
  recursive true
  action :create
end

file '/mnt/ephemeral/jenkins-slave/.ssh/authorized_keys' do
  owner 'jenkins-slave'
  group 'jenkins-slave'
  mode '0600'
  content node[:jenkins][:public_key]
end

jenkins_private_key_credentials 'jenkins-slave' do
  id '82baad23-60db-41d5-984b-9bdf8b497964'
  private_key node[:jenkins][:private_key]
end
