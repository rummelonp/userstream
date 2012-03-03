# -*- coding: utf-8 -*-

module UserStream
  class Client < API
    # Process a userstream by given block
    #
    # @see https://dev.twitter.com/docs/streaming-api/user-streams
    def user(params = {}, &block)
      post('/2/user.json', params, &block)
    end

    # Process public statuses that match one or more filter predicates by given block
    #
    # @see https://dev.twitter.com/docs/streaming-api/methods#statuses-filter
    def filter(params = {}, &block)
      post('/1/statuses/filter.json', params, &block)
    end

    # Process a random sample of all public statuses by given block
    #
    # @see https://dev.twitter.com/docs/streaming-api/methods#statuses-sample
    def sample(params = {}, &block)
      get('/1/statuses/sample.json', params, &block)
    end
  end
end
