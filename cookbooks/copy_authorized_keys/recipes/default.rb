#
# Cookbook Name:: copy_authorized_keys
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
addusers = node['authorization']['adduser']['users']

addusers.each do |adduser|
  directory "/home/" + "#{adduser}" + "/.ssh" do
    owner "#{adduser}"
    group "#{adduser}"
    recursive true
    mode 0700
    action :create
  end

  if platform?("centos")
    file "/home/" + "#{adduser}" + "/.ssh/authorized_keys" do
      content IO.read("/root/.ssh/authorized_keys")
    end
  else
    file "/home/" + "#{adduser}" + "/.ssh/authorized_keys" do
      content IO.read("/home/ec2-user/.ssh/authorized_keys")
    end
  end
end
