class Game < ApplicationRecord
  belongs_to :player_one, class_name: 'Score', foreign_key: 'player_one_score_id'
  belongs_to :player_two, class_name: 'Score', foreign_key: 'player_two_score_id'
end
