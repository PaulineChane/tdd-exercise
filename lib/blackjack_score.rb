# Pauline Chane (@PaulineChane on GitHub)
# Ada Developers Academy Cohort 14
# TDD Blackjack Exercise
# 09/17/2020

# Practice TDD by writing and testing a method to score Blackjack hands (blackjack_score)
# Assume a single deck of cards is used.

# blackjack_score.rb

VALID_CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']

def blackjack_score(hand)
  # check for valid hand size
  raise ArgumentError, "Invalid hand size - Must be 2-5 cards." unless VALID_CARDS[0..3].include? hand.length
  # check for five of the same card
  raise ArgumentError, "Invalid hand -- too many of one suit (max 4)." if hand.length == 5 && hand.uniq.length < 2

  # store any aces you come across
  aces = []

  # since VALID_CARDS is an assortment of strings and numbers, let's convert them into one
  score_array = hand.map do |card|
    # check for valid card
    raise ArgumentError, "Not a valid card." unless VALID_CARDS.include? card

    # log aces for later, but you can add the minimum value
    if card == "Ace"
      # store in an array to denote aces but also push the minimum possible value of Ace into score array
      aces << 1
      1

      # non-Ace face cards
    elsif card.is_a? String
      10

      # number cards
    else
      card
    end

  end

  # store temp sum for now until we can verify any aces
  score = score_array.reduce(:+)

  # account for aces
  unless aces.empty?
    i = 0 # increment variable
    # add 10 per each ace found (based on aces.length) until score + 10 is as close to 21 before going over
    # ... or you run out of aces
    while score + 10 <= 21 && i < aces.length do
      score += 10
      i += 1
    end
  end

  # sum all cards in hand and check for hands that are too large
  raise ArgumentError, "Bust! Score is over 21." if score > 21

  # hand is definitely valid if it makes it to this point
  return score
end

