class Player
  def initialize(name)
    @hand = []
  end

  def give_card(card)
    @hand.push(card)
  end

  def clear_hand
    @hand = []
  end

  def get_hand_count
    
  end


end

def player_hit_sequence
  rand_num = rand(@num_of_cards_deck)
  new_card = @cards[rand_num]
  @cards.delete_at(rand_num)
  @num_of_cards_deck = @num_of_cards_deck - 1
  @player_hand.push(new_card.card_value)
  @player_hand_sum = check_total(@player_hand)
  puts " "
  puts " "
  puts "  and the next card is the.......#{new_card.rank} of #{new_card.suit}"
  puts " "
  puts " "
  puts "  You now have #{@player_hand_sum}"
  @game_over = game_over?(@player_hand_sum)
end
