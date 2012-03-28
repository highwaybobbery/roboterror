class UsersController < ApplicationController
  def create
    session[:current_user] = params[:user][:email]
    @email = params[:user][:email]
    redirect_to root_path
  end
  def show
    
  end
end
