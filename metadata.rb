name             'rsc_jenkins'
maintainer       'RightScale Inc'
maintainer_email 'premium@rightscale.com'
license          'Apache 2.0'
description      'Installs/Configures Jenkins'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

recipe 'rsc_jenkins::default'         , 'Installs Jenkins, required software and users.'
recipe 'rsc_jenkins::add_slave_nodes' , 'Create Jenkins slaves.'
recipe 'rsc_jenkins::_software'       , 'Install required software.'
recipe 'rsc_jenkins::_user'           , 'Create slave user and ssh keys'

depends 'jenkins', '= 2.4.1'

supports 'ubuntu'

attribute "rsc_jenkins/slaves",
  :display_name => "Jenkins slaves",
  :description  => "List of Jenkins slave hosts (separated by commas). IE: slave1.example.com,slave2.example.com",
  :required     => "optional",
  :type         => "array",
  :recipes      => ["rsc_jenkins::default", "rsc_jenkins::add_slave_nodes"]

attribute "rsc_jenkins/public_key",
  :display_name => "Jenkins Public Key",
  :description  => "This public key will be used by Jenkins slave to allow connections from the master/server",
  :required     => "required",
  :recipes      => ["rsc_jenkins::default", "rsc_jenkins::_user"]

attribute "rsc_jenkins/private_key",
  :display_name => "Jenkins Private Key",
  :description  => "This key is used by Jenkins server/master to connect to the slave using SSH.",
  :required     => "required",
  :recipes      => ["rsc_jenkins::default", "rsc_jenkins::_user"]
