class UsersController < ApplicationController
  before_filter :require_admin, :only => [:show, :edit, :update, :destroy]
  before_filter :get_user, :only => [:show, :edit, :update, :destroy]
  before_filter :get_users, :only => [:index, :program]

  def index
  end

  def show
  end

  def new
    @user = User.new
    @user.build_address
    @user.build_report
  end

  def create
    @user = User.new params[:user]
    if @user.save
      flash[:notice] = t 'flash.add_user'
      redirect_to root_url
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:notice] = t 'flash.update_user'
      redirect_to root_url
    else
      render :action => :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to root_url
  end

  def program
  end

  private

  def get_user
    @user = User.find params[:id]
  end

  def get_users
    @users = User.all.group_by(& :section)
  end
end
