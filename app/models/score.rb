class Score < ApplicationRecord
  has_many :games
  belongs_to :users
end
