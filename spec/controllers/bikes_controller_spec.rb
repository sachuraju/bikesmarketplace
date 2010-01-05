require File.dirname(__FILE__) + '/../spec_helper'

describe BikesController do
  describe "index" do
    it "should render the index template" do
      get :index
      response.should render_template(:index)
    end
  end

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

    it "should flash success message on successful save" do
      bike = Bike.new('brand' => nil, 'cost' => nil)
      params = {'brand' => 'blah', 'cost' => 1200}
      Bike.expects(:new).with(params).returns(bike)
      bike.expects(:save).returns(true)

      post :create, 'bike' => {'brand' => 'blah', 'cost' => 1200}
      flash[:notice].should == "Bike successfully created"
    end

    it "should redirect to index action on a successful save" do
      bike = Bike.new('brand' => nil, 'cost' => nil)
      params = {'brand' => 'blah', 'cost' => 1200}
      Bike.expects(:new).with(params).returns(bike)
      bike.expects(:save).returns(true)

      post :create, 'bike' => {'brand' => 'blah', 'cost' => 1200}

      response.should redirect_to(:action => 'index')
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

  describe "edit" do
    it "should render the edit form" do
      Bike.expects(:find).with('1').returns(mock('bike'))

      get :edit, :id => '1'

      response.should render_template(:edit)
    end
  end

  describe "update" do
    describe "successful update" do
      before do
        bike = Bike.new
        params = {'brand' => 'blah', 'cost' => 1200}

        Bike.expects(:find).with(params[:id]).returns(bike)
        bike.expects(:update_attributes).with(params).returns(true)
      end

      it "should successfully update a bike" do
        post :update, 'bike' => {'brand' => 'blah', 'cost' => 1200}
        response.should be_ok
      end

      it "should flash success message on successful update" do
        post :update, 'bike' => {'brand' => 'blah', 'cost' => 1200}
        flash[:notice].should == "Updated successfully"
      end

      it "should redirect to index action " do
        post :update, 'bike' => {'brand' => 'blah', 'cost' => 1200}
        response.should redirect_to(:action => 'index')
      end
    end

    describe "failed update" do
      before do
        bike = Bike.new
        @params = {'brand' => 'blah', 'cost' => 1200}

        Bike.expects(:find).with(@params['id']).returns(bike)
        bike.expects(:update_attributes).with(@params).returns(false)
      end

      it "should not update a bike" do
        post :update, 'bike' => @params
        response.should be_unprocessable_entity
      end

      it "should flash error message on successful updation" do
        post :update, 'bike' => @params
        flash[:notice].should == "Update failed"
      end

      it "should render edit " do
        post :update, 'bike' => @params
        response.should render_template('edit')
      end
    end
  end

  describe "show" do
    it "should render show" do
      params = {:id => '1'}
      Bike.expects(:find).with(params[:id]).returns(mock('bike'))
      get :show, params

      response.should render_template(:show)
    end
  end

  describe "delete" do
    it "should delete a bike" do
      params = {:id => '1'}
      bike = Bike.new
      Bike.expects(:find).with(params[:id]).returns(bike)
      bike.expects(:destroy)

      delete :destroy, params
      
      response.should be_ok
    end

    it "should flash a deleted message" do
      params = {:id => '1'}
      bike = Bike.new
      Bike.expects(:find).with(params[:id]).returns(bike)
      bike.expects(:destroy)

      delete :destroy, params

      flash[:notice].should == "Successfully deleted"
    end
  end

  describe "search by brand" do
    it "should get all the bikes of a particular brand" do
      params = {:brand => 'rbk'}
      Bike.expects(:find_all_by_brand).with(params[:brand]).returns(mock('bike'))

      get :search_by_brand, params
      response.should be_ok
    end
  end

  describe "search by cost" do
    it "should get all the bikes of a particular cost" do
      params = {:cost => '1200'}
      Bike.expects(:find_all_by_cost).with(params[:cost]).returns(mock('bike'))

      get :search_by_cost, params
      response.should be_ok
    end
  end
end
