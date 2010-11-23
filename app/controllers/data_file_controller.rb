class DataFileController < ApplicationController

  def upload
    begin
      DataFile.save(params[:upload])
    rescue
      flash[:error] = 'sdf'
    end
    redirect_to root_path
  end
end
