class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :authenticated?
  before_filter :save_locale
  before_filter :set_locale

  def require_admin
    redirect_to root_url unless authenticated? 
  end

  def authenticated?
    session[:admin] == 'admin'
  end

  def set_locale
    I18n.locale = cookies[:lang] || :en
  end

  def save_locale
    cookies[:lang] = params[:lang] if (params[:lang] != cookies[:lang]) && ['ru','en'].include?(params[:lang])
  end
end
