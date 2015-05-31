name             'yum-amazon'
maintainer       'Chef'
maintainer_email 'Sean OMeara <someara@getchef.com>'
license          'Apache 2.0'
description      'Installs/Configures yum-amazon'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.0'

depends 'yum', '~> 3.0'