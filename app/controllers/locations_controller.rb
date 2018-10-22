class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end

  def show
    @location = Location.find(params[:id])
  end

  def create
    result = LocationsImport.call(file: params[:file])

    if result.success?
      redirect_to :root, notice: 'Success!'
    else
      redirect_to :root, alert: result.error
    end
  end
end
