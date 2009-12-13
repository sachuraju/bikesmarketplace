require File.dirname(__FILE__) + '/../spec_helper'

describe BikesController do
  describe "new" do
      it "should render a new form for creation of bikes " do
      mock_bike = mock('bike')
      Bike.expects(:new).returns(mock_bike)
      get :new

      assigns[:bike].should == mock_bike
      response.should be_created
    end
  end
  
  describe "create" do
    it "should create a new bike" do
      bike = Bike.new('brand' => nil, 'cost' => nil)
      params = {'brand' => 'blah', 'cost' => 1200}
      Bike.expects(:new).with(params).returns(bike)
      bike.expects(:save).returns(true)
      
      post :create, 'bike' => {'brand' => 'blah', 'cost' => 1200}
      response.should be_created
    end

    it "should not create a bike if save fails" do
      bike = Bike.new('brand' => nil, 'cost' => nil)
      params = {'brand' => 'blah', 'cost' => 1200}
      Bike.expects(:new).with(params).returns(bike)
      bike.expects(:save).returns(false)
      
      post :create, 'bike' => {'brand' => 'blah', 'cost' => 1200}
      
      response.should be_unprocessable_entity
      response.should render_template(:new)
    end
  end
end
