$:.unshift File.dirname(__FILE__)

require 'crashdesk'

require 'crashdesk-rails/debug_exceptions'
require 'crashdesk-rails/middleware'
require 'crashdesk-rails/action_controller_context'
require 'crashdesk-rails/version'

require 'crashdesk-rails/railtie' if defined?(Rails::Railtie)
