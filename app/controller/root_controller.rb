class RootController
  attr_reader :request

  def initialize(request)
    @request = request
  end

  def index
    html = '
      <html>
        <head><title>Rack App</title></head>
        <body>
          <h1>Rack App</h1>
        </body>
      </html>
    '

    response(html)
  end

  private

  def response(body, status: 200)
    [status, { "Content-Type" => "text/html" }, [body]]
  end

  def params
    request.params
  end
end
