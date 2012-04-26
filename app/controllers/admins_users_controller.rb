class AdminsUsersController < ApplicationController
  def index
    @users = User.all
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes params[:user]
    redirect_to admin_users_path
  end
end
