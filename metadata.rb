name             'tfly-artifactory'
maintainer       'Ticketfly LLC'
maintainer_email 'chefcookbooks@ticketfly.com'
license          'Apache 2.0'
description      'Installs/Configures tfly-artifactory'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.2'

def supported_operating_systems
  %w(amazon centos debian fedora redhat ubuntu)
end

supported_operating_systems.each { |os| supports os }

recipe 'tfly-artifactory::default', 'Does nothing'
depends          'docker', '~> 2.0'
