class Score < ApplicationRecord
  has_one :player_one, foreign_key: 'player_one_score_id', class_name: 'Game'
  has_one :player_two, foreign_key: 'player_two_score_id', class_name: 'Game'
  belongs_to :user

  validates :score,
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: 0
            }

  def game
    player_one || player_two
  end

  def opponent_name
    return player_one.player_two.user.name if player_one
    return player_two.player_one.user.name if player_two
  end

  def result
    return game.result if player_one
    return game.result == 'W' ? 'L' : 'W' if player_two
  end
end
