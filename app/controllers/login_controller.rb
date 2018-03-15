require_relative './root_controller.rb'

class LoginController < RootController
  LOGIN = 'gendalf'.freeze
  PASSWORD = 'white'.freeze

  # POST /login
  #
  def create
    return log_in if valid_credentials?

    not_allowed
  end

  private

  def valid_credentials?
    params['login'] == LOGIN && params['password'] == PASSWORD
  end

  def log_in
    session[:user_login] = LOGIN

    response
  end
end
