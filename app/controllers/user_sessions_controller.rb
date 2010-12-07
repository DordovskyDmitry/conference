class UserSessionsController < ApplicationController

  def new
  end

  def create
   if Digest::SHA1.hexdigest(params[:admin]+PAS_SALT) == CRYPTED_PAS
      session[:admin] = 'admin'
    end
    redirect_to root_url
  end

  def destroy
    session[:admin] =  nil
    redirect_to root_url
  end
end
