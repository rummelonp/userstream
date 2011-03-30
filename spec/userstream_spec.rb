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

  describe 'rubytter methods' do
    before do
      @userstream.should_receive(:verify_credentials)
      @userstream.should_receive(:user_timeline)
    end
    it 'should receive ...' do
      @userstream.verify_credentials
      @userstream.user_timeline
    end
  end
end
