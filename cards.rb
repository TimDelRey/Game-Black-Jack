# frozen_string_literal: true

class Cards
  attr_accessor 
  attr_reader :cards, :card_value, :player_hand, :dieler_hand
  def initialize
    @cards = []
    @card_value = {}
    @player_hand = {}
    @dieler_hand = {}

    create_cards
    cards_value
  end
  def create_cards
    suits = %w(♤ ♥ ♧ ♦)
    numbers_cards = (2..10).to_a
    pictures_cards = %w(J Q K A).to_a
    ranks = numbers_cards+pictures_cards
    @cards = ranks.product(suits).map { |card, mast| "#{card}#{mast}" }
  end
  def cards_value
    i=0
    values = [2,2,2,2,
              3,3,3,3,
              4,4,4,4,
              5,5,5,5,
              6,6,6,6,
              7,7,7,7,
              8,8,8,8,
              9,9,9,9,
              10,10,10,10,
              10,10,10,10,
              10,10,10,10,
              10,10,10,10,
              {less:1, more:11},
              {less:1, more:11},
              {less:1, more:11},
              {less:1, more:11}]
    @cards.each do |key| 
      @card_value [key] = values[i]
      i+=1
    end
  end

  def start_round   
      player_take_card
      dieler_take_card
      player_take_card
      dieler_take_card
  end

  def player_take_card
    random_card = @cards[rand(@cards.size)]
    @player_hand[random_card] = @card_value[random_card]
    @cards.delete (random_card)
  end

  def dieler_take_card
    random_card = @cards[rand(@cards.size)]
    @dieler_hand[random_card] = @card_value[random_card]
    @cards.delete (random_card)
  end


end