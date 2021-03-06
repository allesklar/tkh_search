# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tkh_search/version'

Gem::Specification.new do |spec|
  spec.name          = "tkh_search"
  spec.version       = TkhSearch::VERSION
  spec.authors       = ["Swami Atma"]
  spec.email         = ["swamiatma@yoga108.org"]
  spec.summary       = %q{Lightweigh Rails search engine}
  spec.description   = %q{A Rails engine providing full text search via the DB. Not suitable for massive apps.}
  spec.homepage      = "https://github.com/allesklar/tkh_search"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency   'activerecord'
  spec.add_dependency   'sanitize'

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
end
