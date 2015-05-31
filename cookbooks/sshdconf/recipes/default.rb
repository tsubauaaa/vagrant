#
# Cookbook Name:: sshdconf
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
service "sshd" do
     supports :status => true, :restart => true, :reload => true
     action [ :enable, :start ]
end

template "sshd_config" do
    path "/etc/ssh/sshd_config"
    source node[:platform] + "/sshd_config.erb"
    user "root"
    group "root"
    mode "600"
    notifies :reload, "service[sshd]"
    variables(
      :addusers => node['authorization']['adduser']['users']
    )
end
