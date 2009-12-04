class BikesController < ApplicationController
  def new
    @bikes = Bike.new
  end
  
  def create
  end
end