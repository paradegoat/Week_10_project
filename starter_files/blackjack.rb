require_relative 'lib/card'
require_relative 'lib/deck'
require_relative 'lib/dealer'
require_relative 'lib/player'
require 'pry'


@user_money = 100
@minimum_bet = 10
  puts " "
  puts " "
  puts "  Hello and welcome to the game of blackjack!"
  puts "  You have $ #{@user_money} and the min bet is $10."
  puts "  would you like to play? (y)es or (n)o"
  puts " "
  puts " "

  def start_game
  user_input = gets.chomp
  if user_input == "y"
    puts "  please give me $10"
    puts " "
    puts "cc number below "
    puts " "
    user_input = gets.chomp
    puts " "
  else
    puts "  play anyway cause this also doesn't do anything"
  end
  @deck = Deck.new
  @deck.shuffle
  @deck = Array(@deck)
  @cards = @deck[0].cards

  # PLAYER
  # Select first card
  @num_of_cards_deck = 52
  rand_num = rand(@num_of_cards_deck)
  @player_card1 = @cards[rand_num]
  @cards.delete_at(rand_num)
  @num_of_cards_deck = @num_of_cards_deck - 1

  @deck2 = Deck.new
  @deck2.shuffle
  player1 = Player.new("Player")
  2.times do
    player1.give_card(deck2.draw)
  end






  # Select second card
  rand_num = rand(@num_of_cards_deck)
  @player_card2 = @cards[rand_num]
  @cards.delete_at(rand_num)
  @num_of_cards_deck = @num_of_cards_deck - 1

  # DEALER
  # Select first card
  rand_num = rand(@num_of_cards_deck)
  @dealer_card1 = @cards[rand_num]
  @cards.delete_at(rand_num)
  @num_of_cards_deck = @num_of_cards_deck - 1

  # Select second card
  rand_num = rand(@num_of_cards_deck)
  @dealer_card2 = @cards[rand_num]
  @cards.delete_at(rand_num)
  @num_of_cards_deck = @num_of_cards_deck - 1


  @player_hand = []
  @player_hand.push(@player_card1.card_value)
  @player_hand.push(@player_card2.card_value)
  @player_hand_sum = @player_hand.inject(:+)
#   def ace_check
#   if @player_card1
#     if (sum <= 20){
#       sum += 1;
#     } else {
#       sum -= 9;
#     }
#   }
# return sum;
# end

  @dealer_hand = []
  @dealer_hand.push(@dealer_card1.card_value)
  @dealer_hand.push(@dealer_card2.card_value)
  @dealer_hand_sum = @dealer_hand.inject(:+)

  puts "  You have the #{@player_card1.rank} of #{@player_card1.suit} and a #{@player_card2.rank} of #{@player_card2.suit} in your hand.
  Your total is: #{@player_hand_sum}"
  puts " "
  puts " "
  puts "  The dealer is showing the #{@dealer_card1.rank} of #{@dealer_card1.suit}"
  puts " "
  puts " "
  puts "  Do you want to (h)it or (s)tand?"
end

def check_total(hand)
  hand.inject(:+)
end

def game_over?(total)
  @game_over = false
  if total > 21
    @game_over = true
  end
end


def compare_player_dealer
  puts "  You have #{@player_hand_sum}"
  puts " "
  puts " "
  puts "  The dealer has #{@dealer_hand_sum}"
  if @player_hand_sum > @dealer_hand_sum
    @user_money = @user_money + @minimum_bet
    puts "  You fuckin' did it"
    puts "  You are up to $ #{@user_money}."
    puts " "
    puts " "
    puts "  wanna play again? (y)es or (n)ot really"
      start_game
  elsif
    @player_hand_sum == @dealer_hand_sum
    puts "  It's a push"
    puts "  You still have $ #{@user_money}."
    puts " "
    puts " "
    puts "  wanna play again? (y)es or (n)ot really"
      start_game


  else
    @user_money = @user_money - @minimum_bet
    puts "  sorry pal"
    puts "  You are down to to $ #{@user_money}."
    puts " "
    puts " "
    puts "  wanna play again? (y)es or (n)ot really"
      start_game
  end

  if @user_money >= 10
    game_sequence
  else
    puts "  you ran out of money"
  end
end

# TODO:  TOOK OUT DEAL FUNCTION

def game_sequence
  user_input = gets.chomp
  if user_input == "h"
    player_hit_sequence
    if @game_over
      puts "  You hit. You now have an #{@player_hand[0]}, #{@player_hand[1]}, and #{@player_hand[2]} in your hand. Your total is #{@player_hand_sum}
        You bust!"
        @user_money = @user_money - @minimum_bet
        start game
    else
      puts "  Do you want to (h)it or (s)tand?"
      game_sequence
    end
  else
    puts "  You decided to stand"
    @dealer_hand_sum = check_total(@dealer_hand)
    # puts @dealer_hand_sum
    dealer_stay_sequence
  end
end
start_game
game_sequence
