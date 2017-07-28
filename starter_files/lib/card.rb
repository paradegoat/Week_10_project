class Card
  attr_accessor :rank, :suit, :card_value
  # these things like :rank are called symbols
  # they refer to the same object throughout a ruby program

  RANKS = [:A, 2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K]
  SUITS = [:clubs, :diamonds, :hearts, :spades]

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
    @card_value = assessment(@rank)
  end

  def assessment(rank)
    case rank
      when 2..10
        return rank
      when :A
        return 1
      when :J, :Q, :K
        return 10
    end
  end

end
