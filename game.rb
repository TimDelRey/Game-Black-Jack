# cd Desktop/RoR/work/thinknetica_part1_BJ

# frozen_string_literal: true

require_relative 'players'
require_relative 'cards'
require_relative 'modules'

class Game
  attr_reader :player, :dieler, :cards, :player_count

  extend Count

  def initialize(name)
    @player = User.new(name)
    @dieler = User.new
    @cards = Cards.new
  end

  def display_hide
    total = @player.hand_sum
    hide = @dieler.hand.size == 2 ? '**' : '***'
    puts "your cash: #{@player.cash} | #{@player.hand.keys} | #{total} point"
    puts "opponent cash: #{@dieler.cash} | cards: #{hide}"
  end

  def display_open
    puts "your cash: #{@player.cash} | #{@player.hand.keys} | #{@player.hand_sum} point"
    puts "opponent cash: #{@dieler.cash} | #{@dieler.hand.keys} | #{@dieler.hand_sum} point"
  end

  def round_one
    puts "Hi #{@player.name} lets GO!"
    puts 'BIDS ACCEPTED, bank: 20$'
    players_move
    dielers_move
    players_move
    dielers_move

    @player.bet
    @dieler.bet

    first_count_cards(@player)
    first_count_cards(@dieler)

    display_hide
  end

  def players_move
    cards.player_take_card(@player)
  end

  def dielers_move
    @cards.dieler_take_card(@dieler)
  end





  def first_count_cards(user)
    user.hand_sum = user.hand.values.sum    
    user.hand_sum -= 10 if user.hand_sum == 22
  end

  def second_count_cards(user)
    user.hand[2] = 1 if user.hand[2] == 11

    user.hand_sum + user.hand[2]
  end




end
