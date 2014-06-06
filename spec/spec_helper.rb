require 'bundler/setup'
require 'webmock/rspec'
require 'VCR'

require_relative '../lib/firmapi.rb'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.allow_http_connections_when_no_cassette = false
end