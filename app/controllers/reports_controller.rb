class ReportsController < ApplicationController
  before_filter :set_user

  def edit
  end

  def update
    if @user.report.update_attributes(params[:report])
      flash[:notice] = t 'flash.update_report'
    end
    redirect_to root_url
  end

  def delete_time
    report = @user.report
    report.begin_report = nil
    report.end_report = nil
    report.save
    redirect_to root_url
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
