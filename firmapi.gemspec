lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'firmapi/version'

Gem::Specification.new do |spec|
  spec.name          = "firmapi"
  spec.version       = Firmapi::VERSION
  spec.authors       = ["Etienne Depaulis"]
  spec.email         = ["etienne.depaulis@gmail.com"]
  spec.description   = %q{Firmapi is a ruby client for www.firmapi.com JSON API}
  spec.summary       = %q{Firmapi is a ruby client for www.firmapi.com JSON API}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake", '~> 10.1.0'
  spec.add_development_dependency "rspec", '~> 2.99'
  spec.add_development_dependency "vcr", '~> 2.9'
  spec.add_development_dependency "webmock", '~> 1.18'
  spec.add_runtime_dependency     "faraday", '~> 0.9'
  spec.add_runtime_dependency     "faraday_middleware", '~> 0.9'
  spec.add_runtime_dependency     "virtus", '~> 1.0'
end