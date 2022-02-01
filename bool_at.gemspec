# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "bool_at/version"

Gem::Specification.new do |spec|
  spec.name          = "bool_at"
  spec.version       = BoolAt::VERSION
  spec.authors       = ["Chong Hui"]
  spec.email         = ["iamchoonggg@gmail.com"]

  spec.summary       = "Convert datetime to boolean in ActiveRecord"
  spec.description   = "Convert datetime to boolean in ActiveRecord."
  spec.homepage      = "https://github.com/choonggg/bool_at"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  # Not recommending old ActiveRecord version
  spec.add_dependency 'activerecord', '>= 6'

  spec.add_development_dependency "bundler", "~> 2.3.6"
  spec.add_development_dependency "pry", "~>0.11.3"
  spec.add_development_dependency "rspec", "~> 3.10"
  spec.add_development_dependency "rubocop", "~> 1.25.0"
  spec.add_development_dependency "sqlite3", "1.4.2"
  spec.add_development_dependency "standalone_migrations", ">= 6"
end
