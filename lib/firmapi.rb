module Firmapi

	require 'virtus'
	require 'faraday'
	require 'faraday_middleware'

	require "firmapi/version"
	require 'firmapi/api'
  require 'firmapi/configuration'
  require 'firmapi/financial_year'
  require 'firmapi/location'
  require 'firmapi/companies'
  require 'firmapi/company'

end
