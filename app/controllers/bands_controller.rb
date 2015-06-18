class BandsController < ApplicationController
  def index
    render :index
  end

  def new
    @band = Band.new
    render :new
  end

  def create
    @band = Band.new(band_params)
  end

  private
  def band_params
    params.require(:band).permit(:name)
  end

end
