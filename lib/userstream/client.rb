# -*- coding: utf-8 -*-

class Userstream
  class Client < API
    def user(params = {}, &block)
      post('/2/user.json', params, &block)
    end
  end
end
