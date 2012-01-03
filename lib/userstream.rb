# -*- coding: utf-8 -*-

require "userstream/version"
require "rubytter"
require "hashie"

class Userstream
  def initialize(consumer, access_token)
    @consumer = consumer
    @access_token = access_token
    @rubytter = OAuthRubytter.new(@access_token)
  end

  def user(params = {}, &block)
    http = create_http
    request = create_signed_request(:post, '/2/user.json', params)
    process(http, request, &block)
  end

  def method_missing(method, *args, &block)
    return super unless @rubytter.respond_to?(method)
    @rubytter.send(method, *args, &block)
  end

  def respond_to?(method)
    return @rubytter.respond_to?(method) || super
  end

  private
  def create_http
    @consumer.send(:create_http)
  end

  def create_signed_request(method, path, params = {})
    @consumer.create_signed_request(method, path, @access_token, {}, params, @rubytter.header)
  end

  def process(http, request, &block)
    raise unless block_given?
    http.request(request) do |response|
      response.read_body do |chunk|
        yield Hashie::Mash.new(JSON.parse(chunk)) rescue next
      end
    end
  end
end
