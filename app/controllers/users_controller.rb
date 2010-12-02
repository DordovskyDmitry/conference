class UsersController < ApplicationController
  before_filter :require_admin, :only => [:show, :edit, :update, :destroy]
  before_filter :get_user, :only => [:show, :edit, :update, :destroy]

  def index
    @users = User.all.group_by(&:section)
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
      redirect_to users_path
    else
      flash[:error] = t 'flash.bad_add_user'
      render :action => :new
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:notice] = t 'flash.update_user'
      redirect_to user_path(@user)
    else
      flash[:error] = t 'flash.bad_update_user'
      render :action => :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  def program
    @users = User.for_program
    @pdf = DataFile.get_first_pdf.gsub('public', '')  unless  DataFile.get_first_pdf.blank?
  end

  private

  def get_user
    @user = User.find params[:id]
  end
end
