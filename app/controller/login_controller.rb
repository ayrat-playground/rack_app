require_relative './root_controller.rb'

class LoginController < RootController
  LOGIN = 'gendalf'.freeze
  PASSWORD = 'white'.freeze

  # GET /login
  #
  def index
    response login_page
  end

  # POST /login
  #
  def create
    return log_in if valid_credentials?

    not_allowed
  end

  private

  def login_page
    '
     <form action="/login" method="post">
       Name:<br>
       <input type="login" name="login"><br>
       Password:<br>
       <input type="password" name="password">
       <br>
       <input type="submit" value="Login">
     </form>
    '
  end

  def valid_credentials?
    params['login'] == LOGIN && params['password'] == PASSWORD
  end

  def log_in
    session[:user_login] = LOGIN

    response('logged in')
  end
end
