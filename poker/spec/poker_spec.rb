require 'card'
require 'deck'
require 'rspec'

describe Card do
  let(:ace_hearts) {Card.new(:A, :hearts)}
  it "holds a value and a suit attribute" do
    expect(ace_hearts.value).to eq(:A)
    expect(ace_hearts.suit).to eq(:hearts)
  end
end

describe Deck do
  let(:deck) {Deck.new}
  it "holds an array that contain 52 cards" do
    # expect(deck.deck).to eq(52)
    expect(deck.deckset.length).to eq(52)
  end

  it "holds four 5s, for example" do
    expect(deck.deckset.select{|card|card.value == :"5"}.length) == 4
  end

  describe '#deal_initial_hand' do
    it "removes necessary cards from the deck when dealing initial hand" do
      deck.deal_initial_hand(4)
      expect(deck.deckset.length).to eq(32)
    end
  end


  describe '#take_from_deck' do
    it "removes a card from the deck as part of exchange" do
      previous_length = deck.deckset.length
      deck.take_from_deck
      expect(deck.deckset.length).to eq(previous_length - 1)
    end
  end

  describe '#insert_into_deck' do
    ace_hearts = Card.new(:"A", :H)
    it "re-inserts card into deck that player wants to exchange" do
      deck.insert_into_deck(ace_hearts)
      expect(deck.deckset).to include(ace_hearts)
    end
  end

  describe '#exchange_cards' do
    ace_hearts = Card.new(:"A", :H)
    ace_spades = Card.new(:"A", :S)
    ace_clubs = Card.new(:"A", :C)
    ace_diamonds = Card.new(:"A", :D)

    it "exchanges cards for new ones and re-inserts old ones into deck" do
      previous_length = deck.deckset.length
      deck.exchange_cards(ace_spades, ace_hearts)
      expect(deck.deckset).to include(ace_spades)
      expect(deck.deckset).to include(ace_hearts)
      expect(deck.deckset.length).to eq(previous_length)
    end

    it "limits player from exchanging more than 3 cards" do
      expect {deck.exchange_cards(ace_hearts, ace_spades, ace_clubs, ace_diamonds)}.to raise_error(ArgumentError)
    end
  end

  
end
