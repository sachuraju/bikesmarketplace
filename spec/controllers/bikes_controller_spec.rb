require File.dirname(__FILE__) + '/../spec_helper'

describe BikesController do
  describe "new" do
      it "should render a new form for creation of bikes " do
    
      get :new
    end
  end
end
