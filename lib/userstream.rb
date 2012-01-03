# -*- coding: utf-8 -*-

require "userstream/version"
require "oauth"
require "json"
require "hashie"

class Userstream
  attr_accessor :header

  def initialize(access_token, options = {})
    @access_token = access_token
    setup(options)
  end

  def setup(options)
    @header = {'User-Agent' => "Userstream/#{VERSION} (http://github.com/mitukiii/userstream)"}
    @header.merge!(options[:header]) if options[:header]
  end

  def user(params = {}, &block)
    http = create_http
    request = create_signed_request(:post, '/2/user.json', params)
    process(http, request, &block)
  end

  private
  def consumer
    @access_token.consumer
  end

  def create_http
    consumer.send(:create_http)
  end

  def create_signed_request(method, path, params = {})
    consumer.create_signed_request(method, path, @access_token, {}, params, @header)
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
