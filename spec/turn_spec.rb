require "rspec"
require "./lib/turn"

RSpec.describe Turn do
  describe "#initialize" do
    it "exists" do 
      card1 = Card.new(:heart, "Jack", 11)
      card2 = Card.new(:heart, "10", 10)
      card3 = Card.new(:heart, "9", 9)
      card4 = Card.new(:diamond, "Jack", 11)
      card5 = Card.new(:heart, "8", 8)
      card6 = Card.new(:diamond, "Queen", 12)
      card7 = Card.new(:heart, "3", 3)
      card8 = Card.new(:diamond, "2", 2)
      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card3, card4, card6, card7])
      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)
      turn = Turn.new(player1, player2)
      expect(turn).to be_a Turn 
    end

    it "has readable attributes" do
      card1 = Card.new(:heart, "Jack", 11)
      card2 = Card.new(:heart, "10", 10)
      card3 = Card.new(:heart, "9", 9)
      card4 = Card.new(:diamond, "Jack", 11)
      card5 = Card.new(:heart, "8", 8)
      card6 = Card.new(:diamond, "Queen", 12)
      card7 = Card.new(:heart, "3", 3)
      card8 = Card.new(:diamond, "2", 2)
      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card3, card4, card6, card7])
      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)
      turn = Turn.new(player1, player2)
      expect(turn.player1).to eq player1
      expect(turn.player2).to eq player2
      expect(turn.spoils_of_war).to eq []
    end
  end 

  describe "#turn" do 
    it "returns correct turn type in a basic turn" do
      card1 = Card.new(:heart, "Jack", 11)
      card2 = Card.new(:heart, "10", 10)
      card3 = Card.new(:heart, "9", 9)
      card4 = Card.new(:diamond, "Jack", 11)
      card5 = Card.new(:heart, "8", 8)
      card6 = Card.new(:diamond, "Queen", 12)
      card7 = Card.new(:heart, "3", 3)
      card8 = Card.new(:diamond, "2", 2)
      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card3, card4, card6, card7])
      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)
      turn = Turn.new(player1, player2)
      expect(turn.type).to eq :basic 
    end

    it "returns correct turn type in a war turn" do 
      card1 = Card.new(:heart, "Jack", 11)
      card2 = Card.new(:heart, "10", 10)
      card3 = Card.new(:heart, "9", 9)
      card4 = Card.new(:diamond, "Jack", 11)
      card5 = Card.new(:heart, "8", 8)
      card6 = Card.new(:diamond, "Queen", 12)
      card7 = Card.new(:heart, "3", 3)
      card8 = Card.new(:diamond, "2", 2)
      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card4, card3, card6, card7])
      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)
      turn = Turn.new(player1, player2)
      expect(turn.type).to eq :war 
    end

    it "returns correct turn type in a m.a.d. turn" do 
      card1 = Card.new(:heart, "Jack", 11)
      card2 = Card.new(:heart, "10", 10)
      card3 = Card.new(:heart, "9", 9)
      card4 = Card.new(:diamond, "Jack", 11)
      card5 = Card.new(:heart, "8", 8)
      card6 = Card.new(:diamond, "8", 8)
      card7 = Card.new(:heart, "3", 3)
      card8 = Card.new(:diamond, "2", 2)
      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card4, card3, card6, card7])
      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)
      turn = Turn.new(player1, player2)
      expect(turn.type).to eq :mutually_assured_destruction
    end
  end

  describe "#winner" do 
    it "returns winner in a basic turn" do
      card1 = Card.new(:heart, "Jack", 11)
      card2 = Card.new(:heart, "10", 10)
      card3 = Card.new(:heart, "9", 9)
      card4 = Card.new(:diamond, "Jack", 11)
      card5 = Card.new(:heart, "8", 8)
      card6 = Card.new(:diamond, "Queen", 12)
      card7 = Card.new(:heart, "3", 3)
      card8 = Card.new(:diamond, "2", 2)
      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card3, card4, card6, card7])
      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)
      turn = Turn.new(player1, player2)
      expect(turn.winner).to eq player1
    end

    it "returns winner in a war turn" do 
      card1 = Card.new(:heart, "Jack", 11)
      card2 = Card.new(:heart, "10", 10)
      card3 = Card.new(:heart, "9", 9)
      card4 = Card.new(:diamond, "Jack", 11)
      card5 = Card.new(:heart, "8", 8)
      card6 = Card.new(:diamond, "Queen", 12)
      card7 = Card.new(:heart, "3", 3)
      card8 = Card.new(:diamond, "2", 2)
      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card4, card3, card6, card7])
      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)
      turn = Turn.new(player1, player2)
      expect(turn.winner).to eq player2
    end

    it "returns winner in a m.a.d. turn" do 
      card1 = Card.new(:heart, "Jack", 11)
      card2 = Card.new(:heart, "10", 10)
      card3 = Card.new(:heart, "9", 9)
      card4 = Card.new(:diamond, "Jack", 11)
      card5 = Card.new(:heart, "8", 8)
      card6 = Card.new(:diamond, "8", 8)
      card7 = Card.new(:heart, "3", 3)
      card8 = Card.new(:diamond, "2", 2)
      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card4, card3, card6, card7])
      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)
      turn = Turn.new(player1, player2)
      expect(turn.winner).to eq "No Winner"
    end
  end

  describe "#pile_cards" do 
    it "adds cards to spoils_of_war array for basic turn" do
      card1 = Card.new(:heart, "Jack", 11)
      card2 = Card.new(:heart, "10", 10)
      card3 = Card.new(:heart, "9", 9)
      card4 = Card.new(:diamond, "Jack", 11)
      card5 = Card.new(:heart, "8", 8)
      card6 = Card.new(:diamond, "Queen", 12)
      card7 = Card.new(:heart, "3", 3)
      card8 = Card.new(:diamond, "2", 2)
      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card3, card4, card6, card7])
      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)
      turn = Turn.new(player1, player2)
      turn.pile_cards
      expect(turn.spoils_of_war).to eq [card1, card3]
    end

    it "adds cards to spoils_of_war array for war turn" do 
      card1 = Card.new(:heart, "Jack", 11)
      card2 = Card.new(:heart, "10", 10)
      card3 = Card.new(:heart, "9", 9)
      card4 = Card.new(:diamond, "Jack", 11)
      card5 = Card.new(:heart, "8", 8)
      card6 = Card.new(:diamond, "Queen", 12)
      card7 = Card.new(:heart, "3", 3)
      card8 = Card.new(:diamond, "2", 2)
      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card4, card3, card6, card7])
      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)
      turn = Turn.new(player1, player2)
      turn.pile_cards
      expect(turn.spoils_of_war).to eq [card1, card2, card5, card4, card3, card6]
    end

    it "removes cards and does not add to spoils_of_war array for m.a.d. turn" do 
      card1 = Card.new(:heart, "Jack", 11)
      card2 = Card.new(:heart, "10", 10)
      card3 = Card.new(:heart, "9", 9)
      card4 = Card.new(:diamond, "Jack", 11)
      card5 = Card.new(:heart, "8", 8)
      card6 = Card.new(:diamond, "8", 8)
      card7 = Card.new(:heart, "3", 3)
      card8 = Card.new(:diamond, "2", 2)
      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card4, card3, card6, card7])
      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)
      turn = Turn.new(player1, player2)
      turn.pile_cards
      expect(turn.spoils_of_war).to eq []
      expect(player1.deck.cards).to eq [card8]
      expect(player2.deck.cards).to eq [card7]
    end
  end

  describe "#award_spoils" do 
    it "awards spoils correctly for basic turn" do 
      card1 = Card.new(:heart, "Jack", 11)
      card2 = Card.new(:heart, "10", 10)
      card3 = Card.new(:heart, "9", 9)
      card4 = Card.new(:diamond, "Jack", 11)
      card5 = Card.new(:heart, "8", 8)
      card6 = Card.new(:diamond, "Queen", 12)
      card7 = Card.new(:heart, "3", 3)
      card8 = Card.new(:diamond, "2", 2)
      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card3, card4, card6, card7])
      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)
      turn = Turn.new(player1, player2)
      winner = turn.winner
      turn.pile_cards 
      turn.award_spoils(winner)
      expect(winner.deck.cards).to eq [card2, card5, card8, card1, card3]
    end

    it "awards spoils correctly for war turn" do 
      card1 = Card.new(:heart, "Jack", 11)
      card2 = Card.new(:heart, "10", 10)
      card3 = Card.new(:heart, "9", 9)
      card4 = Card.new(:diamond, "Jack", 11)
      card5 = Card.new(:heart, "8", 8)
      card6 = Card.new(:diamond, "Queen", 12)
      card7 = Card.new(:heart, "3", 3)
      card8 = Card.new(:diamond, "2", 2)
      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card4, card3, card6, card7])
      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)
      turn = Turn.new(player1, player2)
      winner = turn.winner
      turn.pile_cards 
      turn.award_spoils(winner)
      expect(winner.deck.cards).to eq [card7, card1, card2, card5, card4, card3, card6]
    end
  end
end 