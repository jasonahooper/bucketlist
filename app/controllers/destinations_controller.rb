class DestinationsController < ApplicationController
  def create
    @destination = Destination.new(destination_params)
    if @destination.save
      respond_to do |format|
        format.html {redirect_to destination_path(@destination)}
        format.js { }
      end
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
