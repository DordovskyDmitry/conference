class DataFileController < ApplicationController

  def upload
    begin
      DataFile.save(params[:upload])
      p params[:upload]
      p "save"
    rescue
      flash[:error] = 'sdf'
      p "not save"
    end
    redirect_to root_path
  end
end
