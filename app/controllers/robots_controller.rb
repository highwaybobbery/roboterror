class RobotsController < ApplicationController
  def new
    @robot = Robot.new
  end
end
