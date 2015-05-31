require 'serverspec'

set :backend, :ssh
set :request_pty, true
set :path, '/sbin:/usr/sbin:/usr/local/sbin:$PATH'
