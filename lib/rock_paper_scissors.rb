class RockPaperScissors

  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError ; end

  def self.winner(player1, player2)
    unless player1[1].match(/\A[RPS]\z/) && player2[1].match(/\A[RPS]\Z/)
      raise NoSuchStrategyError, "Strategy must be one of R,P,S"
    end

    player1_wins = player1[1] == player2[1] ||
        (player1[1] == "P" && player2[1] == "R")||
        (player1[1] == "S" && player2[1] == "P")||
        (player1[1] == "R" && player2[1] == "S")
    return player1 if player1_wins else player2

  end

  def self.tournament_winner(tournament)
    if tournament[0][0].is_a?(String)
      return winner(tournament[0], tournament[1])
    else
      return winner(tournament_winner(tournament[0]), tournament_winner(tournament[1]))
    end
  end

end
