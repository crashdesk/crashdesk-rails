module CrashdeskRails
  class Railtie < Rails::Railtie

    initializer "crashdesk.middleware" do |app|
      app.config.middleware.insert 0, "Crashdesk::Rack"
    end

    config.after_initialize do |app|
      Crashdesk.configure do |config|
        config.logger           ||= ::Rails.logger
        config.environment_name ||= ::Rails.env
        config.project_root     ||= ::Rails.root
      end

      Crashdesk.log 'Crashdesk initializing.'

      if defined? ::ActionDispatch::DebugExceptions || defined? ::ActionDispatch::ShowExceptions
        Crashdesk.log 'Crashdesk integrated via including DebugExceptions module.'
        ::ActionDispatch::DebugExceptions.send(:include, CrashdeskRails::DebugExceptions)
      end
    end

  end
end
