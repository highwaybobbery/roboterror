class HomepagesController < ApplicationController
  def index
    if(current_user)
    else
      @user = User.new
    end
  end
end
