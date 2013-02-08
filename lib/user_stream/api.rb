# -*- coding: utf-8 -*-

require "oauth"
require "yajl"
require "hashie"

module UserStream
  class API
    # @private
    attr_accessor *Configuration::OPTIONS_KEYS

    # Creates a new API
    def initialize(options = {})
      options = UserStream.options.merge(options)
      Configuration::OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end

    # Perform an HTTP GET request
    def get(path, params = {}, &block)
      request(:get, path, params, &block)
    end

    # Perform an HTTP POST request
    def post(path, params = {}, &block)
      request(:post, path, params, &block)
    end

    # Perform an HTTP request
    def request(method, path, params = {}, &block)
      token = access_token
      http = token.consumer.http
      request = token.consumer.create_signed_request(method, path, token, {}, params, header)
      process(http, request, &block)
    end

    # Create a new consumer
    def consumer
      OAuth::Consumer.new(consumer_key, consumer_secret, :site => endpoint, :timeout => 90)
    end

    # Create a new access token
    def access_token
      OAuth::AccessToken.new(consumer, oauth_token, oauth_token_secret)
    end

    private
    def header
      {'User-Agent' => user_agent}
    end

    def process(http, request, &block)
      raise ArgumentError, "expected a block" unless block_given?
      http.request(request) do |response|
        code = response.code.to_i
        unless code == 200
          error = case code
                  when 401 then Unauhtorized
                  when 403 then Forbidden
                  when 404 then Unknown
                  when 406 then NotAcceptable
                  when 413 then TooLong
                  when 416 then RangeUnacceptable
                  when 420 then RateLimited
                  when 500 then ServerInternalError
                  when 503 then ServiceOverloaded
                  else Error end
          raise error.new response.message, response
        end
        buffer = ''
        response.read_body do |chunk|
          buffer += chunk
          next unless chunk.match(/\r\n$/)
          begin
            status = parse_chunk(buffer)
          rescue
            next
          ensure
            buffer = ''
          end
          yield status
        end
      end
    end

    def parse_chunk(chunk)
      Hashie::Mash.new(Yajl.load(chunk))
    end
  end
end
