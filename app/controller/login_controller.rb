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
    if params['login'] == LOGIN && params['password'] == PASSWORD
      return response('ok')
    end

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

  def not_allowed
    response('You shall not pass', status: 403)
  end
end
