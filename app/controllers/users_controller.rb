class UsersController < ApplicationController

  def index
    @users = User.find(:all, :order => :name)

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])


    respond_to do |format|
      if @user.save
        flash[:notice] = "User #{@user.name} was successfully created."
        format.html { redirect_to(:action => 'index') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = "User #{@user.name} was successfully updated."
        format.html { redirect_to(:action => index) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
    end
  end

  def existing
    p "Hellooooooooooooooo"
    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def user_login
    @user = User.authenticate(params[:name], params[:password])
    if @user.nil?
      flash[:notice] = "Incorrect username/password combination."
      format.html { redirect_to(:controller => :home, :action => 'index') }
    end
  end
end
