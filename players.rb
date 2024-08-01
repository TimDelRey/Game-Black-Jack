# cd Desktop/RoR/work/thinknetica_part1_BJ

# frozen_string_literal: true

class User
  attr_accessor :hand
  attr_reader :cash, :name

  def initialize (name = 'Dieler')
    @name = name
    @cash = 100
    @hand = {}
  end

  def win_round
    @cash+=20
  end

  def bet
    @cash-=10
  end

  def draw
    @cash+=10
  end
end