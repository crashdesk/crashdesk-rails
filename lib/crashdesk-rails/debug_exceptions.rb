module CrashdeskRails
  module DebugExceptions

    def self.included(base)
      base.send(:alias_method_chain, :render_exception, :crashdesk)
    end

    def render_exception_with_crashdesk(env, exception)
      request = Rack::Request.new(env)
      context = ActionControllerContext.new(env['action_controller.instance'], request)

      begin
        crashlog = Crashdesk.crashlog(exception, request, context)
        crashlog.report
      rescue Exception => e
        $stderr.puts "Crashdesk gem can has a bug: #{e.message}"
      end

      render_exception_without_crashdesk(env, exception)
    end

  end
end
