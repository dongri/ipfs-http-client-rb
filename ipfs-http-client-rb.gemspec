# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ipfs-http-client-rb/version'

Gem::Specification.new do |spec|
  spec.name          = 'ipfs-http-client-rb'
  spec.version       = Ipfs::VERSION
  spec.authors       = ['Dongri Jin']
  spec.email         = ['dongrify@gmail.com']
  spec.license       = 'MIT'

  spec.summary       = 'IPFS HTTP client'
  spec.description   = 'Ruby HTTP client for the Interplanetary File System'
  spec.homepage      = 'https://github.com/dongri/ipfs-http-client-rb'

  spec.files         = Dir['README.md', 'lib/**/*']
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.7'

  spec.add_dependency 'http', '~> 4.4.1'

  spec.add_development_dependency 'bundler', '~> 2.2.16'
  spec.add_development_dependency 'rake', '~> 13.0.3'
  spec.add_development_dependency 'byebug', '~> 11.1.3'
  spec.add_development_dependency 'rspec', '~> 3.10.0'
  spec.add_development_dependency 'webmock', '~> 3.12.2'
  spec.add_development_dependency 'sinatra', '~> 2.1.0'
end
