class DataFileController < ApplicationController
  before_filter :require_admin

  def upload
    begin
      DataFile.save(params[:upload], params[:dirname])
    rescue
      flash[:error] = 'Upload error'
    end
    redirect_to :back
  end

  def delete_all
    DataFile.delete_all_pdf(params[:dirname])
    redirect_to :back
  end
end
