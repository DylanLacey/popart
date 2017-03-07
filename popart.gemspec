# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'popart/version'

Gem::Specification.new do |spec|
  spec.name          = "popart"
  spec.version       = Popart::VERSION
  spec.authors       = ["Dylan Lacey"]
  spec.email         = ["github@dylanlacey.com"]

  spec.summary       = %q{Check what your site looks like in multiple browsers.}
  spec.description   = %q{Popart shows you what your site looks like, rendered in
    a bunch of browsers. Make your own piece of modern art, powered by Ruby,
    sharing and the letter L.  Also Sauce Labs.}
  spec.homepage      = "http://www.github.com/dylanlacey/popart"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"

  spec.add_dependency "parallel"
  spec.add_dependency "selenium-webdriver"
end
