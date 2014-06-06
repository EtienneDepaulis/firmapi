require 'bundler/setup'
require 'webmock/rspec'
require 'VCR'

require_relative '../lib/firmapi.rb'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.allow_http_connections_when_no_cassette = false
  c.before_record do |i|
    i.response.body.force_encoding('UTF-8')
  end
end

RSpec.configure do |c|
	c.before(:suite) do
    Firmapi.configure do |config|
      config.api_key = "secret_api_key"
    end
  end
end