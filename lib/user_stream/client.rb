# -*- coding: utf-8 -*-

module UserStream
  class Client < API
    def user(params = {}, &block)
      post('/2/user.json', params, &block)
    end
  end
end
