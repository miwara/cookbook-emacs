#
# Cookbook Name:: emacs
# Recipe:: default
#
default["emacs"]["name"] = "emacs-24.3"
default["emacs"]["prefix"] = "/usr/local"

default["emacs"]["tar"]["uri"] = "http://core.ring.gr.jp/pub/GNU/emacs/#{node['emacs']['name']}.tar.gz"
