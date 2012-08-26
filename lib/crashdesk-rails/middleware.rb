module CrashdeskRails
  class Middleware

    def initialize(app)
      @app = app
    end

    def call(env)
      begin
        status, headers, body = @app.call(env)
      rescue Exception => exception

        request = Rack::Request.new(env)
        context = ActionControllerContext.new(env['action_controller.instance'], request)

        crashlog = Crashdesk.crashlog(exception, request, context)
        crashlog.report

        env['crashdesk.crashlog_crc'] = crashlog.crc

        raise
      end

      [status, headers, body]
    end

  end
end
