class Game < ApplicationRecord
  belongs_to :player_one, class_name: 'Score', foreign_key: 'player_one_score_id'
  belongs_to :player_two, class_name: 'Score', foreign_key: 'player_two_score_id'

  def date
    created_at.strftime('%b %d')
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
