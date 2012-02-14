# -*- coding: utf-8 -*-

module UserStream
  class Client < API
    # Process a userstream by given block
    #
    # @see https://dev.twitter.com/docs/streaming-api/user-streams
    def user(params = {}, &block)
      post('/2/user.json', params, &block)
    end

    # Process a search stream by given block
    #
    # @see https://dev.twitter.com/docs/streaming-api/methods#statuses-filter
    def search(params = {}, &block)
      post('/1/statuses/filter.json', params, &block)
    end
  end
end
