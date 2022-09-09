require "./lib/card.rb"
require "./lib/deck.rb"
require "./lib/player.rb"
require "./lib/turn.rb"
require "./lib/card_generator.rb"

class Game 
  def initialize
    @deck1 = card_setup("deck1")
    @deck2 = card_setup("deck2")
    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora", @deck2)
    @turn_count = 0
  end

  def intro
    print "Welcome to War! (or Peace) This game will be played with 52 cards.\nThe players today are Megan and Aurora.\nType 'GO' to start the game!\n------------------------------------------------------------------\n"
    user_input = gets.chomp.upcase 
    until user_input == "GO" 
      user_input = gets.chomp.upcase 
    end 
    start
  end 

  def start 
    until game_over? do 
      play_game
    end 
    end_game
  end

  def card_setup(deck)
    all_cards = CardGenerator.new("cards.txt").cards
    shuffled_once = all_cards.shuffle
    shuffled_twice = shuffled_once.shuffle
    shuffled_thrice = shuffled_twice.shuffle
    cards1 = shuffled_thrice[0..25]
    cards2 = shuffled_thrice[26..51]
    if deck == "deck1" then Deck.new(cards1) else Deck.new(cards2) end
  end 

  def game_over?
    @turn_count == 1000000 || @player1.has_lost? || @player2.has_lost?
  end

  def play_game
    turn = Turn.new(@player1, @player2)
    if turn.type == :mutually_assured_destruction
      puts "Turn #{@turn_count + 1}: *mutually assured destruction* 6 cards removed from play"
    elsif turn.type == :war 
      puts "Turn #{@turn_count + 1}: WAR - #{turn.winner.name} won 6 cards"
    else
      puts "Turn #{@turn_count + 1}: #{turn.winner.name} won 2 cards"
    end
    if turn.type == :basic || turn.type == :war 
      winner = turn.winner 
      turn.pile_cards 
      turn.award_spoils(winner)
    else 
      turn.pile_cards
    end
    @turn_count += 1
  end

  def end_game 
    if @turn_count == 1000000
      puts "---- DRAW ----"
    elsif @player1.has_lost? 
      puts "*~*~*~* #{@player2.name} has won the game! *~*~*~*"
    else 
      puts "*~*~*~* #{@player1.name} has won the game! *~*~*~*"
    end
  end
end 
