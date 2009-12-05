class BikesController < ApplicationController
  def new
    @bike = Bike.new
    render :action => 'new'
  end
  
  def create
    @bike = Bike.new(params[:bike])
    if @bike.save
      head :ok
    else
      render :action => 'new', :status => :unprocessable_entity
    end
  end
end