require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Userstream do
  before do
    @consumer = OAuth::Consumer.new('consumer key', 'consumer secret')
    @access_token = OAuth::AccessToken.new(@consumer, 'oauth token', 'oauth token secret')
    @userstream = Userstream.new(@consumer, @access_token)
  end

  describe :new do
    subject { @userstream }
    it { should be_instance_of Userstream }
  end
end
