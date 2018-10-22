require 'pry'

class Deck

    def initialize
        create_deck
    end

    def cards
        Card.all.select do | card |
            card.deck == self
        end
    end

    def create_deck
        suit_array = ["Hearts", "Clubs", "Diamonds", "Spades"]
        rank_array = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]

        suit_array.each do |suit|
            rank_array.each do |rank|
                Card.new(suit, rank, self)
            end
        end
    end

    def choose_card
        card = self.cards[rand(self.cards.length)]
        index = Card.all.index(card)
        Card.all.delete_at(index)
    end
end

class Card

    attr_reader :suit, :rank, :deck
    @@all = []

    def initialize(suit, rank, deck = Deck.new)
        @suit = suit
        @rank = rank
        @deck = deck
        @@all << self
    end

    def self.all
        @@all
    end

end

#binding.pry
