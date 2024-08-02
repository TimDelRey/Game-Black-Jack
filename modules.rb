# cd Desktop/RoR/work/thinknetica_part1_BJ

# frozen_string_literal: true

module Count
  def first_count_cards(user)
    user.hand_sum = user.hand.sum    
    user.hand_sum -= 10 if user.hand_sum == 22
  end

  def second_count_cards(user)
    user.hand[2] = 1 if user.hand[2] == 11

    user.hand_sum + user.hand[2]
  end
end







  #   was_first_ace = false
  #   user.hand.values do |point|
  #     if point == 11
  #       was_first_ace = true
  #       point = 1
  #     end
  #   end
  #   count = user.hand.values.sum
  # end