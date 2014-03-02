class RSP_Implement
  
  include Comparable
  attr_reader :implement

  def initialize(implement)
	@implement = implement
  end

  def <=>(another)
	return 0 if @implement == another.implement
	if @implement == "R" then
	  return -1 if another.implement == "P"
	  return 1 #another must be scissors
	end
	if @implement == "P" then
	  return -1 if another.implement == "S"
	  return 1 # another must be rock
	end
	if @implement == "S" then
	  return -1 if another.implement == "R"
	  return 1 # another must be paper
	end
  end
end

class RockPaperScissors
  class NoSuchStrategyError < StandardError ; end

  def self.winner(player1, player2)
	raise NoSuchStrategyError, "Strategy must be one of R,P,S" if player1[1] =~ /[^RSP]/
	raise NoSuchStrategyError, "Strategy must be one of R,P,S" if player2[1] =~ /[^RSP]/
	return player2 if RSP_Implement.new(player2[1]) > RSP_Implement.new(player1[1]) 
	player1
  end

  def self.tournament_winner(tournament)
	if tournament[0][0].is_a?String then
	  winner = RockPaperScissors.winner(tournament[0], tournament[1])
	else
	  winner = RockPaperScissors.winner(
		tournament_winner(tournament[0]),
		tournament_winner(tournament[1]))
    end
  end
end
