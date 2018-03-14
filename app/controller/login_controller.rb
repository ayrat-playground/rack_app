require_relative './root_controller.rb'

class LoginController < RootController
  # GET /login
  #
  def index
    response login_page
  end

  def create
    response('ok')
  end

  def login_page
    '
     <form action="/login" method="post">
       Name:<br>
       <input type="text" name="name"><br>
       Password:<br>
       <input type="text" name="password">
       <input type="submit" value="Login">
     </form>
    '
  end
end
