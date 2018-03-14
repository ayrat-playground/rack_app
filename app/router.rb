class Router
  attr_reader :request

  def initialize(request)
    @request = request
  end

  def process_request
    parse_request_info

    controller = controller_class
    return not_found unless controller

    controller_instance = controller.new(@request)
    action = route_info[:action]

    if controller_instance.respond_to?(action)
      return controller_instance.public_send(action.to_sym)
    end
  end

  private

  def not_found
    [404, { 'Content-Type' => 'text/plain' }, [':(']]
  end

  def controller_class
    controller_name = "#{request.params[:resource].capitalize}Controller"

    Object.const_get(controller_name)
  rescue NameError
    nil
  end

  def parse_request_info
    request.params.merge!(route_info)
  end

  def route_info
    resource = parse_resource || 'root'
    action = parse_action

    { resource: resource, action: action }
  end

  def parse_action
    request.get? ? :index : :create
  end

  def parse_resource
    request.path.split("/").reject { |s| s.empty? }.first
  end
end
