# Firmapi

[![Gem Version](https://badge.fury.io/rb/firmapi.svg)](http://badge.fury.io/rb/firmapi) [![CI Build Status](https://secure.travis-ci.org/EtienneDepaulis/firmapi.png?branch=master)][travis] [![Code Climate](https://codeclimate.com/github/EtienneDepaulis/firmapi.png)][codeclimate] [![Coverage Status](https://coveralls.io/repos/EtienneDepaulis/firmapi/badge.png?branch=master)][coveralls]

[rubygems]: http://rubygems.org/gems/firmapi
[travis]: http://travis-ci.org/EtienneDepaulis/firmapi
[codeclimate]: https://codeclimate.com/github/EtienneDepaulis/firmapi
[coveralls]: https://coveralls.io/r/EtienneDepaulis/firmapi?branch=master

Firmapi is a ruby client for [Firmapi](https://firmapi.com/) JSON API.

## Installation

Add this line to your application's Gemfile:

    gem 'firmapi'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install firmapi

## Usage

### Configuration

Firmapi can be configured (ideally inside an initializer) by
calling Firmapi.configure like so:

    Firmapi.configure do |config|
      # An api key is mandatory to use the service
      config.api_key = "123456"
    end

### Gathering information about a company

#### Using the SIREN number

    company = Firmapi::Company.find_by_siren!(480470152)
    company.name # => "EVANGELINA"

    Firmapi::Company.find_by_siren!("INVALID SIREN") # => Firmapi::Company::NoCompanyFound: 'No company was found with the siren 'INVALID SIREN'.'

#### Using the postal_code

    companies = Firmapi::Companies.where(postal_code: 69)
    companies.results # => 103307
    companies.number_of_pages # => 1033
    companies.to_a # => [Company1, Company2, ...]

More info on search parameters [here](https://firmapi.com/docs/call/search).

You can also navigate using the `:next_page` method:

    companies.next_page
    companies.page = 2

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

The MIT License (MIT)

Copyright (c) 2014 Etienne Depaulis

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
