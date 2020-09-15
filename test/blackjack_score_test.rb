# Pauline Chane (@PaulineChane on GitHub)
# Ada Developers Academy Cohort 14
# TDD Blackjack Exercise
# 09/17/2020

# Practice TDD by writing tests to validate functionality for a method that scores Blackjack hands (blackjack_score)

require 'minitest'
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/pride'

require_relative '../lib/blackjack_score'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Blackjack Score' do
  it 'can calculate the score for a pair of number cards' do

    # Arrange
    hand = [3, 4]

    # Act
    score = blackjack_score(hand)

    # Assert <-  You do this part!
    expect(score).must_equal 7
  end

  it 'facecards have values calculated correctly' do
    # Arrange
    hand = ["Queen", "King"]

    # Act
    score = blackjack_score(hand)

    # Assert
    expect(score).must_equal 20
  end

  it 'calculates aces as 11 where it does not go over 21' do
    # Arrange
    hands = [["Ace", 9],["Ace","Ace","Ace"], [2, 4, 4, "Ace"]]

    # Act
    score = hands.map{ |hand| blackjack_score(hand) }

    # Assert
    expect(score).must_equal [20, 13, 21]
  end

  it 'calculates aces as 1, if an 11 would cause the score to go over 21' do
    # Arrange
    hand = ["Ace", 9, "Queen"]

    # Act
    score = blackjack_score(hand)

    # Assert
    expect(score).must_equal 20
  end

  it 'raises an ArgumentError for invalid cards' do
    # Invalid strings

    expect {
      blackjack_score(["Joker", 2])
    }.must_raise ArgumentError

    # Invalid numbers
    expect {
      blackjack_score([18, 2])
    }.must_raise ArgumentError

    # Invalid number pt. 2
    expect {
      blackjack_score([18.5, "Ace"])
    }.must_raise ArgumentError

  end

  it 'raises an ArgumentError for scores over 21' do
    expect {
      blackjack_score([9, 8, 7])
    }.must_raise ArgumentError
  end

  it 'raises an ArgumentError for invalid hand size (less than 2 and more than 5 cards)' do
    # Hand too small
    expect {
      blackjack_score([5])
    }.must_raise ArgumentError

    # Hand too large
    expect {
      blackjack_score([2, 3, 4, 5, 6, 7, "King"])
    }.must_raise ArgumentError
  end

end
