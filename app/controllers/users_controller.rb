class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email])
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Logged in as #{@user.first_name} #{@user.last_name}"
      redirect_to dashboard_path
    else
      flash.now[:error] = 'Something went wrong. Please try again.'
      render :new
    end
  end

  def show
    if current_user
      @user = current_user
    else
      redirect_to login_path
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(first_name: params[:first_name], last_name: params[:last_name], email: params[:email])

    flash.notice = 'Profile Updated!'
    redirect_to dashboard_path
  end
end
