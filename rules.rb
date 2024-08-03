# cd Desktop/RoR/work/thinknetica_part1_BJ

# frozen_string_literal: true

require_relative 'cards'

module Rules
  def display_hide(player, dieler)
    total = player.hand_sum
    hide = dieler.hand.size == 2 ? '* *' : '* * *'
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
      big_ace_arr = user.hand.find { |_key, value| value == 11 }
      user.hand[big_ace_arr[0]] = 1 if !!big_ace_arr && user.hand_sum > 21
    end
    user.hand_sum = user.hand.values.sum
  end

  def second_dieler_move(dieler)
    dieler.hand_sum = dieler.hand.values.sum
    if dieler.hand_sum < 17
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

  def congratulations(player, dieler)
    puts '!!!YOU ARE WIN THE GAME!!!' if dieler.cash <= 0
    puts 'YOU LOSE GAME' if player.cash <= 0 
  end

  def take_bet(player, dieler)
  
    condition_one = player.hand_sum <= 21 && 
                    dieler.hand_sum > 21

    condition_two = dieler.hand_sum < 21 &&
                    player.hand_sum <= 21 && 
                    (21 - player.hand_sum) < (21 - dieler.hand_sum)

    if condition_one || condition_two
      player.win_round
      puts 'Round WIN'
    elsif player.hand_sum == dieler.hand_sum
      player.draw
      dieler.draw
      puts 'No one won'
    else
      dieler.win_round
      puts 'Round LOSE'
    end
  end
end
