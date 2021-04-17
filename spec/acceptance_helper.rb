# frozen_string_literal: true

require 'spec_helper'
require 'webmock/rspec'
require 'mock_api'

RSpec.configure do |config|
  config.before :each do
    WebMock.disable_net_connect!
    stub_request(:any, /#{Regexp.escape(base_url)}/).to_rack MockAPI
  end
end

def ipfs_client
  Ipfs::Client.new default_endpoint
end

def default_endpoint
  'http://myhost.com:6035'
end

def base_url
  "#{default_endpoint}/api/v0"
end