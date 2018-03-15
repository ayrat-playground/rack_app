class RootController
  attr_reader :request

  def initialize(request)
    @request = request
  end

  def index
    response
  end

  private

  def response(body = template, status: 200)
    [status, { 'Content-Type' => 'text/html' }, [body]]
  end

  def params
    request.params
  end

  def session
    request.session
  end

  def not_allowed
    response('You shall not pass', status: 403)
  end

  def template(name = params[:action])
    templates_dir = self.class.name.downcase.sub('controller', '')
    template_file = File.join(templates_dir, "#{name}.html.erb")

    file_path = template_file(template_file)
    render_erb_file(file_path)
  end

  def template_file(file_name)
    File.expand_path(File.join('../../views', file_name), __FILE__)
  end

  def render_erb_file(file_path)
    File.read(file_path)
  end
end
