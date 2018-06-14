# coding: utf-8
# frozen_string_literal: true

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "bool_at/version"

Gem::Specification.new do |spec|
  spec.name          = "bool_at"
  spec.version       = BoolAt::VERSION
  spec.authors       = ["Chong Hui"]
  spec.email         = ["iamchoonggg@gmail.com"]

  spec.summary       = "Convert datetime to boolean in ActiveRecord"
  spec.description   = "Convert datetime to boolean in ActiveRecord"
  spec.homepage      = ""
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Not recommending old ActiveRecord version but good to support
  spec.add_dependency "activerecord", ">= 4.2.0"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "sqlite3", "1.3.13"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rubocop", "~> 0.48.1"
  spec.add_development_dependency "standalone_migrations", "~> 5.2.0"
end
