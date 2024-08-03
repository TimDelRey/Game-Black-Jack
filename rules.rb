# cd Desktop/RoR/work/thinknetica_part1_BJ

# frozen_string_literal: true

require_relative 'cards'

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

  def count_cards(user)
    if !!user.hand
      user.hand_sum = user.hand.values.sum
      big_ace_arr = user.hand.find { |key, value| value == 11 }
      if !!big_ace_arr && user.hand_sum > 21
        user.hand[big_ace_arr[0]] = 1
      end
    end
    user.hand_sum = user.hand.values.sum
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
