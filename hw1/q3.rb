class RockPaperScissors

  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError ; end

	  def self.winner(player1, player2)

		# if ((player1[1].match(/[PSR]/)&&(player2[1].match(/[PSR]/) ) ) )
		if(! "RPS".include? player1[1])
			raise NoSuchStrategyError, "Strategy must be one of R,P,S"
		end
		if(! "RPS".include? player2[1])
			raise NoSuchStrategyError, "Strategy must be one of R,P,S"
		end
		
		if(player1[1] == player2[1])
			return player1
		end	

		if((player1[1] == "R" && player2[1] == "S") || (player1[1] == "S" && player2[1] == "P") || (player1[1] == "P" && player2[1] == "R") )

			return player1
		else 

			return player2
		end
	  end

  	def self.tournament_winner(tournament)
  		if (tournament.flatten.length == 4)
 		 return self.winner(tournament[0],tournament[1])  	
  		end
  		
	  tournament = [tournament_winner(tournament[0]), tournament_winner(tournament[1])]
	  tournament_winner(tournament)

  	end  

end 