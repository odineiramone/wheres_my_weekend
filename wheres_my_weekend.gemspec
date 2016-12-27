# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wheres_my_weekend/version'

Gem::Specification.new do |spec|
  spec.name          = "wheres_my_weekend"
  spec.version       = WheresMyWeekend::VERSION
  spec.authors       = ["Odinei Rocha"]
  spec.email         = ["odinei.ribeiro@live.com"]

  spec.summary       = "Gem that indentifies weekends!"
  spec.homepage      = "http://github.com/odineiribeiro/wheres_my_weekend"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
