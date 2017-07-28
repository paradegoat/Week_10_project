def dealer_stay_sequence
  if @dealer_hand_sum > 16
    compare_player_dealer
  else
    dealer_hit_sequence
    if @game_over
      puts "  The dealer bust. The dealer has greater than 21. You win!"
      @user_money = @user_money + @minimum_bet
      puts "  You are up to $ #{@user_money}."
      puts " "
      puts " "
      puts "  wanna play again? (y)es or (n)ot really"
      start_game
    else
      dealer_stay_sequence
    end
  end
end

def dealer_hit_sequence
  rand_num = rand(@num_of_cards_deck)
  new_card = @cards[rand_num]
  @cards.delete_at(rand_num)
  @num_of_cards_deck = @num_of_cards_deck - 1
  @dealer_hand.push(new_card.card_value)
  @dealer_hand_sum = check_total(@dealer_hand)
  @game_over = game_over?(@dealer_hand_sum)
end
