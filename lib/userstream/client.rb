# -*- coding: utf-8 -*-

require "oauth"
require "json"
require "hashie"

class Userstream
  class Client
    attr_accessor *Configuration::OPTIONS_KEYS

    def initialize(options = {})
      options = Userstream.options.merge(options)
      Configuration::OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end

      consumer = OAuth::Consumer.new(consumer_key, consumer_secret, {:site => endpoint})
      @access_token = OAuth::AccessToken.new(consumer, oauth_token, oauth_token_secret)
    end

    def user(params = {}, &block)
      http = create_http
      request = create_signed_request(:post, '/2/user.json', params)
      process(http, request, &block)
    end

    private
    def header
      {'User-Agent' => user_agent}
    end

    def consumer
      @access_token.consumer
    end

    def create_http
      consumer.send(:create_http)
    end

    def create_signed_request(method, path, params = {})
      consumer.create_signed_request(method, path, @access_token, {}, params, header)
    end

    def process(http, request, &block)
      raise ArgumentError, "expected a block" unless block_given?
      http.request(request) do |response|
        response.read_body do |chunk|
          yield Hashie::Mash.new(JSON.parse(chunk)) rescue next
        end
      end
    end
  end
end
