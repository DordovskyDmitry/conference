class ApplicationController < ActionController::Base
  protect_from_forgery

  def require_admin
    true
  end
end
