# cd Desktop/RoR/work/thinknetica_part1_BJ

# frozen_string_literal: true

#так как пересчет идет поновому каждый раз. значения первых двух туов не исправить
# менять значнеие туза в первом райунде если сумма после второго больше 21

require_relative 'cards'
# require_relative 'game'

module Rules
  def display_hide(player, dieler)
    total = player.hand_sum
    hide = dieler.hand.size == 2 ? '**' : '***'
    puts "your cash: #{player.cash}$ | #{player.hand.keys} | #{total} point"
    puts "opponent's cash: #{dieler.cash}$ | cards: #{hide}"
  end

  def display_open(player, dieler)
    puts "your cash: #{player.cash}$ | #{player.hand.keys} | #{player.hand_sum} point"
    puts "opponent's cash: #{dieler.cash}$ | #{dieler.hand.keys} | #{dieler.hand_sum} point"
  end

  def users_move(user)
    cards.user_take_card(user)
  end

  def first_count_cards(user)
    user.hand_sum = user.hand.values.sum
    user.hand_sum -= 10 if user.hand_sum == 22
  end

  def second_count_cards(user)
    user.hand_sum = user.hand.values.sum
    if !!user.hand[2]
      user.hand[2] = 1 if user.hand[2] == 11 || user.hand_sum > 21
      user.hand_sum + user.hand[2]
    end
  end

  def second_dieler_move(dieler)
    dieler.hand_sum = dieler.hand.values.sum
    if  dieler.hand_sum < 17
      users_move(dieler)
      puts 'Dialer took the card'
    else
      puts 'Dialer skip the move'
    end
  end

  def reset_score(player, dieler)
    part_initialize
    player.hand = {}
    dieler.hand = {}
  end
end
