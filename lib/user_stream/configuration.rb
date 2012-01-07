# -*- coding: utf-8 -*-

module UserStream
  # Defines constants and methods related to configuration
  module Configuration
    # An array of keys in the options hash when configuring a {UserStream::API}
    OPTIONS_KEYS = [
      :consumer_key,
      :consumer_secret,
      :oauth_token,
      :oauth_token_secret,
      :user_agent,
      :endpoint,
    ].freeze

    # By default, don't set a consumer key
    DEFAULT_CONSUMER_KEY       = nil

    # By default, don't set a consumer secret
    DEFAULT_CONSUMER_SECRET    = nil

    # By default, don't set an oauth token
    DEFAULT_OAUTH_TOKEN        = nil

    # By default, don't set an oauth token secret
    DEFAULT_OAUTH_TOKEN_SECRET = nil

    # The user agent that will be sent to the API endpoint if none is set
    DEFAULT_USER_AGENT = "UserStream/#{VERSION} (http://github.com/mitukiii/userstream)".freeze

    # The endpoint that will be used to connect if none is set
    #
    # @note Specify a different API version, or use a Twitter-compatible endpoint.
    # @see https://dev.twitter.com/docs/streaming-api/user-streams
    DEFAULT_ENDPOINT = 'https://userstream.twitter.com/'.freeze

    # @private
    attr_accessor *OPTIONS_KEYS

    # When this module is extended, set all configuration options to their default values
    def self.extended(base)
      base.reset
    end

    # Convenience method to allow configuration options to be set in a block
    def configure
      yield self
      self
    end

    # Create a hash of options and their values
    def options
      OPTIONS_KEYS.inject({}) do |options, key|
        options.merge!(key => send(key))
      end
    end

    # Reset all configuration options to defaults
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
