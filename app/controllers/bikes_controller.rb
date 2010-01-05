class BikesController < ApplicationController
  def index
    @bikes = Bike.find(:all)
  end

  def new
    @bike = Bike.new
    render :action => 'new'
  end
  
  def create
    @bike = Bike.new(params[:bike])
    if @bike.save
      flash[:notice] = "Bike successfully created"
      redirect_to(:action => 'index')
    else
      render :action => 'new', :status => :unprocessable_entity
    end
  end

  def edit
    @bike = Bike.find(params[:id])
  end

  def update
    @bike = Bike.find(params[:id])

    if @bike.update_attributes(params[:bike])
      flash[:notice] = "Updated successfully"
      redirect_to(:action => 'index')
    else
      flash[:notice] = "Update failed"
      render :action => :edit, :status => :unprocessable_entity
    end
  end

  def show
    @bike = Bike.find(params[:id])
  end

  def destroy
    @bike = Bike.find(params[:id])
    @bike.destroy

    flash[:notice] = "Successfully deleted"
    redirect_to(:action => 'index')
  end

  def search_by_brand
    @bikes = Bike.find_all_by_brand(params[:brand])
  end

  def search_by_cost
    @bikes = Bike.find_all_by_cost(params[:cost])
  end
end