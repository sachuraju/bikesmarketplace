require File.dirname(__FILE__) + '/../spec_helper'

describe BikesController do
  describe "new" do
      it "should render a new form for creation of bikes " do
      Bike.expects(:new).returns(mock_bike = stub_everything)
      get :new

      assigns[:bike].should == mock_bike
      response.should be_success
    end
  end
end
