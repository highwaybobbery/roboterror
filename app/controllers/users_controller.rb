class UsersController < ApplicationController
  def create
    @user = User.new(params[:user])
    if(@user.save)
      redirect_to @user
    else
      render root_path
    end
  end
  def show
    
  end
end
