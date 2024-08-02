# frozen_string_literal: true

require_relative 'players'

class Cards
  attr_accessor
  attr_reader :cards, :card_value

  def initialize
    @cards = []
    @card_value = {}

    create_cards
    cards_value
  end

  def create_cards
    suits = %w[♤ ♥ ♧ ♦]
    numbers_cards = (2..10).to_a
    pictures_cards = %w[J Q K A].to_a
    ranks = numbers_cards + pictures_cards
    @cards = ranks.product(suits).map { |card, mast| "#{card}#{mast}" }
  end

  def cards_value
    i = 0
    values = [2, 2, 2, 2,
              3, 3, 3, 3,
              4, 4, 4, 4,
              5, 5, 5, 5,
              6, 6, 6, 6,
              7, 7, 7, 7,
              8, 8, 8, 8,
              9, 9, 9, 9,
              10, 10, 10, 10,
              10, 10, 10, 10,
              10, 10, 10, 10,
              10, 10, 10, 10,
              11, 11, 11, 11]
    @cards.each do |key|
      @card_value [key] = values[i]
      i += 1
    end
  end

  def user_take_card(user)
    random_card = @cards[rand(@cards.size)]
    user.hand[random_card] = @card_value[random_card]
    @cards.delete(random_card)
  end

end
