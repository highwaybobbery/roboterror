class Fight

  def initialize( attacker, opponent )
    @results = {}
    @results[:attacker] = attacker
    @results[:opponent] = opponent

    simulate_combat(attacker, opponent)
    give_awards

    @fight_result = FightResult.new(@results)
    @fight_result.save
  end

  private

  def simulate_combat(attacker, opponent)
    opponent_stats = opponent.calculate_stats
    attacker_stats = attacker.calculate_stats

    binding.pry

    if opponent_stats[:damage] > attacker_stats[:damage]
      @results[:winner] = attacker
      @results[:loser] = opponent
    else
      @results[:winner] = opponent
      @results[:loser] = attacker
    end

    @results[:winner_hp] = winner.stats[:health] - loser.stats[:damage]
    @results[:elapsed_time] = 500
    @results[:timeline] = [{time: 500, message: "#{winner.name} kills #{loser.name} with #{winner_hp}hp to spare"}]
  end

  def give_awards
    @results[:winner_xp] = 100
    @results[:loser_xp] = 20

    @results[:winner_payout] = 1000
    @results[:loser_payout] = 120
  end
end
