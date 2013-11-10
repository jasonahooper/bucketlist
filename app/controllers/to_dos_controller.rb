class ToDosController < ApplicationController

  def create
    @to_do = ToDo.new(to_do_params)
    @to_do.destination_id = params[:destination_id]
    @to_do.save!
    respond_to do |format|
      format.html { redirect_to destination_to_do_path(@to_do.destination_id, @to_do) }
      format.js { @to_dos = ToDo.all }
    end
  end

  def show
    @to_do = ToDo.find(params[:id])
  end

  def index
    if params[:destination_id] # we are on sub-path
      @destination = Destination.find(params[:destination_id])
      respond_to do |format|
        format.js do
          @to_dos = Destination.
            find(params[:destination_id]).to_dos.order(params[:sort])
        end
        format.html do
          @to_dos = Destination.find(params[:destination_id]).to_dos
        end
        format.json do
          render :json => Destination.find(params[:destination_id]).
            to_dos.as_json(:only => [:latitude, :longitude, :name])
        end
      end
    else
      respond_to do |format|
        format.json { render :json => ToDo.all.as_json(:only =>
          [:latitude, :longitude, :name]) }
      end
    end
  end

  private
    def to_do_params
      params.require(:to_do).permit(:name, :image_url, :priority, :where,
          :latitude, :longitude, :destination_id)
    end
end
