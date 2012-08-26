module CrashdeskRails
  module DebugExceptions

    def self.included(base)
      base.send(:alias_method_chain, :render_exception, :crashdesk)
    end

    # We are overriding this method as we don't want
    # to write our own middleware yet.
    def render_exception_with_crashdesk(env, exception)
      request = Rack::Request.new(env)
      context = ActionControllerContext.new(env['action_controller.instance'], request)

      crashlog = Crashdesk.crashlog(exception, request, context)
      crashlog.report

      render_exception_without_crashdesk(env, exception)
    end

  end
end
