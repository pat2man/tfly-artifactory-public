name             'tfly-artifactory'
maintainer       'Ticketfly, Inc.'
maintainer_email 'chefcookbooks@ticketfly.com'
license          'Apache 2.0'
description      'Installs/Configures tfly-artifactory'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

def supported_operating_systems
  %w( debian ubuntu )
end

supported_operating_systems.each { |os| supports os }

recipe 'tfly-artifactory::default', 'Does nothing'