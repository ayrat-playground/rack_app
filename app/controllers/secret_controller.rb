require_relative './root_controller.rb'

class SecretController < RootController
  def index
    return response if authenticated?

    not_allowed
  end

  private

  def authenticated?
    session[:user_login] == LoginController::LOGIN
  end
end
