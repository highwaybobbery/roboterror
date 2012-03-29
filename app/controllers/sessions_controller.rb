class SessionsController < ApplicationController
  def destroy
    reset_session
    puts session
    redirect_to root_path
  end
end
