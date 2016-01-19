class SessionsController < ApplicationController
  def create
    binding.pry
    user = User.create_or_find_by_auth(auth_params)
    session[:user_id] = user.id
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def auth_params
    request.env['omniauth.auth']
  end
end
