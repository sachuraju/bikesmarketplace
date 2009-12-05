class BikesController < ApplicationController
  def new
    @bike = Bike.new
    render :action => 'new'
  end
  
  def create
    @bike = Bike.new(params[:bike])
    
    @bike.save
    head :ok
  end
end