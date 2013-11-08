class ToDosController < ApplicationController

  def create
    @to_do = ToDo.new(to_do_params)
    if @to_do.save
      respond_to do |format|
        format.html { redirect_to to_do_path(@to_do) }
        format.js { }
      end
    else
    end
  end

  def show
    @to_do = ToDo.find(params[:id])
  end

  private
    def to_do_params
      params.require(:to_do).permit(:name, :image_url, :priority, :where,
          :latitude, :longitude, :destination_id)
    end
end
