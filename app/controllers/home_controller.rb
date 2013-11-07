class HomeController < ApplicationController
  def index
    @destination = Destination.new
  end
end
