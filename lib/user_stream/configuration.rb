# -*- coding: utf-8 -*-

module UserStream
  module Configuration
    OPTIONS_KEYS = [
      :consumer_key,
      :consumer_secret,
      :oauth_token,
      :oauth_token_secret,
      :user_agent,
      :endpoint,
    ].freeze

    DEFAULT_CONSUMER_KEY       = nil
    DEFAULT_CONSUMER_SECRET    = nil

    DEFAULT_OAUTH_TOKEN        = nil
    DEFAULT_OAUTH_TOKEN_SECRET = nil

    DEFAULT_USER_AGENT = "UserStream/#{VERSION} (http://github.com/mitukiii/userstream)".freeze

    DEFAULT_ENDPOINT = 'https://userstream.twitter.com/'.freeze

    attr_accessor *OPTIONS_KEYS

    def self.extended(base)
      base.reset
    end

    def configure
      yield self
      self
    end

    def options
      OPTIONS_KEYS.inject({}) do |options, key|
        options.merge!(key => send(key))
      end
    end

    def reset
      self.consumer_key       = DEFAULT_CONSUMER_KEY
      self.consumer_secret    = DEFAULT_CONSUMER_SECRET
      self.oauth_token        = DEFAULT_OAUTH_TOKEN
      self.oauth_token_secret = DEFAULT_OAUTH_TOKEN_SECRET
      self.user_agent         = DEFAULT_USER_AGENT
      self.endpoint           = DEFAULT_ENDPOINT
    end
  end
end
