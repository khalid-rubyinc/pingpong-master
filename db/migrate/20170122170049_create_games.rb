class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.integer :player_one_score_id
      t.integer :player_two_score_id
      t.date :played_at

      t.timestamps
    end
  end
end
