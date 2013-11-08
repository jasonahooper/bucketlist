class HomeController < ApplicationController
  def index
    @destination = Destination.new
    @to_do = ToDo.new
    @destinations = Destination.all
  end
end
