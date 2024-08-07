# cd Desktop/RoR/work/thinknetica_part1_BJ

# frozen_string_literal: true

require_relative 'players'
require_relative 'cards'
require_relative 'rules'

class Game
  attr_reader :player, :dieler, :cards, :player_count

  include Rules

  def initialize; end

  def part_initialize
    @cards = Cards.new
  end

  def play
    puts "Hello! What's your name?"
    name = gets.chomp
    puts "Lets play #{name}!"
    @player = User.new(name)
    @dieler = User.new
    part_initialize
    loop do
      start_round
      puts 'Continue?'
      puts '1 - Continue, 2 - Stop'
      break if gets.chomp.to_i == 2 || @player.cash <= 0 || @dieler.cash <= 0
    end
    congratulations(@player, @dieler)
  end

  def start_round
    round_one
    round_two
  end

  def round_one
    puts '_____________________________'
    puts 'BIDS ACCEPTED, bank: 20$'

    users_move(@player)
    users_move(@dieler)
    users_move(@player)
    users_move(@dieler)

    @player.bet
    @dieler.bet

    count_cards(@player)
    count_cards(@dieler)

    display_hide(@player, @dieler)
  end

  def round_two
    puts '1 - SKIP | 2 - ADD CART | 3 - OPEN CART'
    case gets.chomp.to_i
    when 1
      second_dieler_move(@dieler)
      count_cards(@dieler)
      take_bet(@player, @dieler)
      display_open(@player, @dieler)
      reset_score(@player, @dieler)
    when 2
      users_move(@player)
      count_cards(@player)
      second_dieler_move(@dieler)
      count_cards(@dieler)
      take_bet(@player, @dieler)
      display_open(@player, @dieler)
      reset_score(@player, @dieler)
    when 3
      take_bet(@player, @dieler)
      display_open(@player, @dieler)
      reset_score(@player, @dieler)
    else
      # rescue EFGERGFERFE
      puts 'Choise 1 or 2 or 3'
      round_two
    end
  end
end
