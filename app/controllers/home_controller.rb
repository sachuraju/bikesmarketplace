class HomeController < ApplicationController

  def index
    
  end

  def search

  end

  def new_user_login
    redirect_to :controller => :users, :action => :new
  end

  def existing_user_login
    redirect_to :controller => :users, :action => :existing
  end

end