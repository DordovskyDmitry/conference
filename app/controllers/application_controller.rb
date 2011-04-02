class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :authenticated?
  before_filter :set_locale
  before_filter :find_abstract

  def require_admin
    redirect_to root_url unless authenticated?
  end

  def authenticated?
    session[:admin] == 'admin'
  end

  def set_locale
    # ((lang = request.env['HTTP_ACCEPT_LANGUAGE']) && lang[/^[a-z]{2}/])
     I18n.locale = ['en', 'ru', 'uk'].include?(params[:locale]) ? params[:locale] :  'en'
  end

  def default_url_options(options = {})
    {:locale => I18n.locale}
  end

  def find_abstract
    @pdf = DataFile.get_first_pdf('abstract').gsub('public', '')  unless  DataFile.get_first_pdf('abstract').blank?
  end
end
