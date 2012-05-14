class FightsController < ApplicationController
  def new
    @opponent = Robot.find(params[:robot_id])
    @fight_result = FightResult.new
  end

  def create
    opponent = Robot.find(params[:fight_result][:opponent_id])
    attacker = Robot.find(params[:fight_result][:attacker_id])
    fight = Fight.new(attacker, opponent)
    fight_result = fight.fight_result
    redirect_to fight_result_path(fight_result)
  end
end
