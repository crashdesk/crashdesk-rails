module CrashdeskRails

  class ActionControllerContext < Crashdesk::ContextBase

    def initialize(controller, request)
      @controller = controller
      @request = request
    end

    # Extract all meaningfull data from our controller.
    def to_hash
      {
        'url' => request_url,
        'controller_name' => controller_name,
        'action_name' => action_name,
        'parameters' => parameters,
        'request_method' => request_method,
        'remote_ip' => remote_ip,
        'headers' => headers,
        'session' => session
      }
    end

    def framework
      "rails"
    end

    def framework_version
      Rails::VERSION::STRING
    end

    def request_url
      @request.respond_to?(:url) ? @request.url : "#{@request.protocol}#{@request.host}#{@request.request_uri}"
    end

    def controller_name
      @controller.class.to_s
    end

    def action_name
      @request.respond_to?(:parameters) ? @request.parameters['action'] : @request.params['action']
    end

    def remote_ip
      @request.respond_to?(:remote_ip) ? @request.remote_ip : @request.ip
    end

    def parameters
      filter_parameters(@request.respond_to?(:parameters) ? @request.parameters : @request.params)
    end

    def request_method
      @request.request_method.to_s
    end

    def headers
      extract_http_headers(@request.env)
    end

    def session
      extract_session(@request)
    end

    private

    def filter_hash(keys_to_filter, hash)
      keys_to_filter.map! {|x| x.to_s}
      if keys_to_filter.is_a?(Array) && !keys_to_filter.empty?
        hash.each do |key, value|
          if key_match?(key, keys_to_filter)
            hash[key] = "[FILTERED]"
          elsif value.respond_to?(:to_hash)
            filter_hash(keys_to_filter, hash[key])
          end
        end
      end
      hash
    end

    def filter_parameters(hash)
      if @request.respond_to?(:env) && @request.env["action_dispatch.parameter_filter"]
        filter_hash(@request.env["action_dispatch.parameter_filter"], hash)
      elsif @controller.respond_to?(:filter_parameters)
        @controller.send(:filter_parameters, hash)
      else
        hash
      end
    end

  end

end
