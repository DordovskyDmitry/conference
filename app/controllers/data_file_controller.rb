class DataFileController < ApplicationController
  before_filter :require_admin

  def upload
    begin
      DataFile.save(params[:upload])
    rescue
      flash[:error] = 'sdf'
    end
    redirect_to :back
  end

  def delete_all
    DataFile.delete_all_pdf
    redirect_to :back
  end
end
