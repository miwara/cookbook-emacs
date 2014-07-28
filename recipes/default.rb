#
# Cookbook Name:: emacs
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "ncurses-devel" do
  action :install
end

remote_file "/tmp/#{node['emacs']['name']}.tar.gz" do
  source "#{node['emacs']['tar']['uri']}"
  mode 0644
end

execute "emacs" do
  cwd "/tmp"
  
  command <<-EOH
  tar xfz /tmp/#{node['emacs']['name']}.tar.gz; \
  cd /tmp/#{node['emacs']['name']}; \
  ./configure --prefix=#{node['emacs']['prefix']}; \
  make && make install; \
  cd;
  EOH

  creates "#{node['emacs']['prefix']}/bin/emacs"
end

# .emacs.d
directory "/home/louise/.emacs.d/" do
  owner "louise"
  group "louise"
  mode "0755"
  action :create
end
