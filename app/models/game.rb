class Game < ApplicationRecord
  belongs_to :player_one, class_name: 'Score', foreign_key: 'player_one_score_id'
  belongs_to :player_two, class_name: 'Score', foreign_key: 'player_two_score_id'

  validate :score_greater_than_two
  validates :player_one_score_id, presence: true
  validates :player_two_score_id, presence: true
  validates :played_at, presence: true

  def score_greater_than_two
    return unless player_one && player_two
    if (player_one.score - player_two.score).abs < 2
      errors.add(:Score, "must win by at least two points")
    end
  end

  def date
    played_at.strftime('%b %d')
  end

  def score
    "#{player_one.score}-#{player_two.score}"
  end

  def result
    player_one.score > player_two.score ? 'W' : 'L'
  end

  def users(current_user)
    users = User.all.where(['id != ?', current_user.id])
  end
end
