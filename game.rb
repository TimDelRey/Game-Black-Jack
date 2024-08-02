# cd Desktop/RoR/work/thinknetica_part1_BJ

# frozen_string_literal: true

require_relative 'players'
require_relative 'cards'
require_relative 'rules'

class Game
  attr_reader :player, :dieler, :cards, :player_count

  include Rules

  def initialize(name)
    @player = User.new(name)
    @dieler = User.new
    @cards = Cards.new
  end

  def round_one
    puts "Hi #{@player.name} lets GO!"
    puts 'BIDS ACCEPTED, bank: 20$'

    users_move(@player)
    users_move(@dieler)
    users_move(@player)
    users_move(@dieler)

    @player.bet
    @dieler.bet

    first_count_cards(@player)
    first_count_cards(@dieler)

    display_hide(@player, @dieler)
  end
end
