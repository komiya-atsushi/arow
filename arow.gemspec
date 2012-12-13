# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'arow/version'

Gem::Specification.new do |gem|
  gem.name          = "arow"
  gem.version       = AROW::VERSION
  gem.authors       = ["KOMIYA Atsushi"]
  gem.email         = ["komiya.atsushi@gmail.com"]
  gem.description   = %q{A pure ruby implementation of the AROW}
  gem.summary       = %q{A pure ruby implementation of the AROW}
  gem.homepage      = "http://k11i.biz/"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
