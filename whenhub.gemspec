# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'whenhub/version'

Gem::Specification.new do |spec|
  spec.name          = "whenhub"
  spec.version       = WhenHub::VERSION
  spec.authors       = ["Matt Gillooly"]
  spec.email         = ["git@mattgillooly.com"]

  spec.description   = %q{a gem for the WhenHub API}
  spec.summary       = spec.description
  spec.homepage      = 'http://github.com/mattgillooly/whenhub'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'rest-client'
  spec.add_dependency 'virtus'

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
