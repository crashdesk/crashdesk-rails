# -*- encoding: utf-8 -*-
require File.expand_path('../lib/crashdesk-rails/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name = 'crashdesk-rails'
  gem.version = CrashdeskRails::VERSION
  gem.authors = ["Ladislav Martincik"]
  gem.summary = "Crashde.sk Rails Integration"
  gem.description = "crashdesk-rails is the Rails gem for integration with crashde.sk servers"
  gem.email = "info@crashde.sk"
  gem.files =  Dir['lib/**/*'] + Dir['spec/**/*'] + Dir['*.rb'] + ["crashdesk-rails.gemspec", "Rakefile"]
  gem.homepage = "http://crashde.sk"
  gem.require_paths = ["lib"]
  gem.rubyforge_project = "crashdesk-rails"
  gem.add_dependency('crashdesk', '~> 0')
  gem.add_dependency('rails', '~> 3.0')
end
