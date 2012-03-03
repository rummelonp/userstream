# UserStream

UserStream is a simple twitter userstream library.

## Install

    $ gem install userstream

## Example

    require 'user_stream'
    
    UserStream.configure do |config|
      config.consumer_key = 'consumer key'
      config.consumer_secret = 'consumer secret'
      config.oauth_token = 'oauth token'
      config.oauth_token_secret = 'oauth token secret'
    end
    
    client = UserStream.client
    
    client.user do |status|
      # ... do something.
    end
    
    client.filter(:track => 'twitter') do |status|
      # ... do something.
    end
    
    client.sample do |status|
      # ... do something.
    end

## Requirement

    oauth
    hashie

## Copyright

Released under the MIT license: http://www.opensource.org/licenses/MIT
