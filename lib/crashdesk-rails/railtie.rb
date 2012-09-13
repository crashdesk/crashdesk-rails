module CrashdeskRails
  class Railtie < Rails::Railtie

    config.after_initialize do |app|
      Crashdesk.configure do |config|
        config.logger           ||= ::Rails.logger
        config.environment_name ||= ::Rails.env
        config.project_root     ||= ::Rails.root
      end

      Crashdesk.log 'Crahsdesk initializing.'

      if defined? ::ActionDispatch::DebugExceptions
        Crashdesk.log 'Crashdesk integrated via including DebugExceptions module.'
        # DebugException is middleware inside Rails
        # Would be nice to have our own with nice message rendering.
        ::ActionDispatch::DebugExceptions.send(:include, CrashdeskRails::DebugExceptions)

        # Also there's ShowException middleware we could override with much
        # nicer default rendering.
      else
        Crashdesk.log 'Crashdesk integrated via middleware.'
        app.config.middleware.use "CrashdeskRails::Middleware"
      end
    end

  end
end
