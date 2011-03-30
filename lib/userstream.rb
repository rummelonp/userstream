require 'rubytter'

class Userstream
  def initialize(consumer, access_token)
    @consumer = consumer
    @access_token = access_token
    @rubytter = OAuthRubytter.new(@access_token)
  end
end
