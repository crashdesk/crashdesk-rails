module Crashdesk
  module Generators
    class InitializerGenerator < Rails::Generators::Base
      desc "Create a Crashdesk initializer file at config/initializers/crashdesk.rb"
      source_root File.expand_path('../templates', __FILE__)

      def create_initializer
        copy_file "crashdesk.rb", "config/initializers/crashdesk.rb"
      end
    end
  end
end
