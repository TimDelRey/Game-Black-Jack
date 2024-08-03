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
    part_initialize
  end

  def part_initialize
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

  def round_two
    puts '1 - SKIP | 2 - ADD CART | 3 - OPEN CART'
    case gets.chomp.to_i
    when 1
      second_dieler_move(@dieler)
      second_count_cards(@dieler)
      display_open(@player, @dieler)
      reset_score(@player, @dieler)
    when 2
      users_move(@player)
      second_count_cards(@player)
      second_dieler_move(@dieler)
      second_count_cards(@dieler)
      display_open(@player, @dieler)
      reset_score(@player, @dieler)
    when 3
      display_open(@player, @dieler)
      reset_score(@player, @dieler)
    else 
      # rescue EFGERGFERFE
      puts 'Choise 1 or 2 or 3'
      round_two
    end
  end
end
