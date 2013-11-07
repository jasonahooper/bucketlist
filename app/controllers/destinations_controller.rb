class DestinationsController < ApplicationController
  def create
    @destination = Destination.new(destination_params)
    if @destination.save
      redirect_to destination_path(@destination)
    else
    end
  end

  def new
  end

  private
    def destination_params
      params.require(:destination).permit(:name, :image_url, :traveller_id)
    end
end
