# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dpr/version'

Gem::Specification.new do |spec|
  spec.name          = "dpr"
  spec.version       = Dpr::VERSION
  spec.authors       = ["SudhagarS"]
  spec.email         = ["sudhagar@isudhagar.in"]

  spec.summary       = "The simplest Ruby HTTP client."
  spec.description   = "The simplest Ruby HTTP client. Dpr lets you do HTTP directly on URL strings."
  spec.homepage      = "https://www.github.com/SudhagarS/dpr"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency 'guard', '~> 2.13', '>= 2.13.0'
  spec.add_development_dependency 'guard-rspec', '~> 4.6', '>= 4.6.3'
  spec.add_development_dependency 'pry', '>= 0.9.10', '< 0.11.0'
  spec.add_runtime_dependency "unirest", '~> 1.1', '>= 1.1.2'
end
