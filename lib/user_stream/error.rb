# -*- coding: utf-8 -*-

module UserStream
  # Custom error class for rescuing from all Twitter errors
  class Error < StandardError
    attr_reader :response

    def initialize(msg, response = nil)
      super(msg)
      @response = response
    end
  end

  # Raised when Twitter returns the HTTP status code 401
  class Unauhtorized < Error
  end

  # Raised when Twitter returns the HTTP status code 403
  class Forbidden < Error
  end

  # Raised when Twitter returns the HTTP status code 404
  class Unknown < Error
  end

  # Raised when Twitter returns the HTTP status code 406
  class NotAcceptable < Error
  end

  # Raised when Twitter returns the HTTP status code 413
  class TooLong < Error
  end

  # Raised when Twitter returns the HTTP status code 416
  class RangeUnacceptable < Error
  end

  # Raised when Twitter returns the HTTP status code 420
  class RateLimited < Error
  end

  # Raised when Twitter returns the HTTP status code 500
  class ServerInternalError < Error
  end

  # Raised when Twitter returns the HTTP status code 503
  class ServiceOverloaded < Error
  end
end
