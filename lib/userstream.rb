require 'rubytter'

class Userstream
  def initialize(consumer, access_token)
    @consumer = consumer
    @access_token = access_token
    @rubytter = OAuthRubytter.new(@access_token)
  end

  def method_missing(method, *args, &block)
    return super unless @rubytter.respond_to?(method)
    @rubytter.send(method, *args, &block)
  end

  def respond_to?(method)
    return @rubytter.respond_to?(method) || super
  end
end
