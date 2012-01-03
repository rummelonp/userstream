# -*- coding: utf-8 -*-

require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Userstream do
  before do
    Userstream.configure do |config|
      config.consumer_key = 'consumer key'
      config.consumer_secret = 'consumer secret'
      config.oauth_token = 'oauth token'
      config.oauth_token_secret = 'oauth token secret'
    end
    @client = Userstream.client
  end

  describe :client do
    subject { @client }
    it { should be_a Userstream::Client }
  end

  describe :user do
    context 'not block given' do
      it do
        lambda {
          @client.user
        }.should raise_error(ArgumentError)
      end
    end

    context 'block given' do
      pending 'TODO: Should write user specs.'
    end
  end
end
