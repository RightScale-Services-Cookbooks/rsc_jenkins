node.default['jenkins']['master']['install_method'] = 'war'
node.default['jenkins']['master']['source'] = node['rsc_jenkins']['war_url']
node.default['jenkins']['master']['checksum'] = node['rsc_jenkins']['checksum']

include_recipe 'rsc_jenkins::_software'
include_recipe 'jenkins::master'
include_recipe 'rsc_jenkins::_user'
