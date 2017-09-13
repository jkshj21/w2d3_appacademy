require_relative "card"

class Deck

  attr_reader :deckset

  VALUES = [:"2",:"3",:"4",:"5",:"6",:"7",:"8",:"9",:"10",:"J",:"Q",:"K",:"A"]
  SUITS = [:D, :C, :H, :S]

  def initialize
    @deckset = []
    create_deck
  end

  def create_deck
    SUITS.each do |suit|
      VALUES.each do |val|
        new_card = Card.new(val, suit)
        @deckset << new_card
      end
    end
  end

  def deal_initial_hand(players)
    @deckset.shuffle!
    cards_for_hand = []
    (players * 5).times do |i|
      cards_for_hand << deckset.shift
    end
    cards_for_hand
  end

  def exchange_cards(*cards)
    if cards.length > 3
      raise ArgumentError
    else
      outbound_cards = []
      cards.each do |c|
        insert_into_deck(c)
        outbound_cards << take_from_deck
      end
    end
  end

  def take_from_deck
    new_card = deckset.shift
    new_card
  end

  def insert_into_deck(card)
    deckset << card
  end



end
