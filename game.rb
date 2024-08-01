# cd Desktop/RoR/work/thinknetica_part1_BJ

# frozen_string_literal: true

require_relative 'players'
require_relative 'cards'

class Game
  attr_reader :player, :dialer, :cards

  def initialize (name)
    @player = User.new(name)
    @dieler = User.new
    @cards = Cards.new

  end 

  def display_hide
    hide = @dieler.hand.size == 2? '**' : '***'
    puts "your cash:#{@player.cash} | #{@player.hand.keys} | total point"
    puts "opponent cash:#{@dieler.cash} | cards: #{hide}"
  end

  def display_open
    puts "your cash:#{@player.cash} | #{@player.hand.keys} | total point"
    puts "opponent cash:#{@dieler.cash} | #{@dialer.hand.keys} | total point"
  end

  def start_round
    puts "Hi #{@player.name} lets GO!"
    puts 'BIDS ACCEPTED, bank: 20$'
    @cards.player_take_card(@player)
    @cards.dieler_take_card(@dieler)
    @cards.player_take_card(@player)
    @cards.dieler_take_card(@dieler)
    @player.bet
    @dieler.bet
    display_hide
  end


end
