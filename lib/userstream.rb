# -*- coding: utf-8 -*-

require "userstream/version"
require "userstream/config"
require "userstream/api"
require "userstream/client"

class Userstream
  extend Configuration

  def self.client(options = {})
    Userstream::Client.new(options)
  end

  def self.method_missing(method_name, *args, &block)
    return super unless client.respond_to?(method_name)
    client.send(method_name, *args, &block)
  end

  def self.respond_to?(method_name)
    return client.respond_to?(method_name) || super
  end
end
