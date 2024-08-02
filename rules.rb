# cd Desktop/RoR/work/thinknetica_part1_BJ

# frozen_string_literal: true

module Rules
  def display_hide(player, dieler)
    total = player.hand_sum
    hide = dieler.hand.size == 2 ? '**' : '***'
    puts "your cash: #{player.cash} | #{player.hand.keys} | #{total} point"
    puts "opponent cash: #{dieler.cash} | cards: #{hide}"
  end

  def display_open(player, dieler)
    puts "your cash: #{player.cash} | #{player.hand.keys} | #{player.hand_sum} point"
    puts "opponent cash: #{dieler.cash} | #{dieler.hand.keys} | #{dieler.hand_sum} point"
  end

  def users_move(user)
    cards.user_take_card(user)
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
