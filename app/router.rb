class Router
  attr_reader :request

  def initialize(request)
    @request = request
  end

  def process_request
    if request.path == "/"
      [200, { "Content-Type" => "text/plain" }, ['Hello World']]
    else
      [404, { "Content-Type" => "text/plain" }, [':(']]
    end
  end
end
