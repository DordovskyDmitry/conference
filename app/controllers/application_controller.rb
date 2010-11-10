class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :authenticated?

  def require_admin
    redirect_to root_url unless authenticated? 
  end

  def authenticated?
    session[:admin] == 'admin'
  end
end
