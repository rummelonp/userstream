# -*- coding: utf-8 -*-

require "user_stream/version"
require "user_stream/configuration"
require "user_stream/api"
require "user_stream/client"

module UserStream
  extend Configuration

  # Alias for UserStream::Client.new
  #
  # @return [UserStream::Client]
  def self.client(options = {})
    UserStream::Client.new(options)
  end

  # Delegate to {UserStream::Client}
  def self.method_missing(method_name, *args, &block)
    return super unless client.respond_to?(method_name)
    client.send(method_name, *args, &block)
  end

  # Delegate to {UserStream::Client}
  def self.respond_to?(method_name)
    return client.respond_to?(method_name) || super
  end
end
