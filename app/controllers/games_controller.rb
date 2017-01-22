class GamesController < ApplicationController

  def create
    game = Game.new
    game.played_at = params[:played_at]

    my_score = Score.new
    my_score.user_id = current_user.id
    my_score.score = params[:score]
    my_score.save

    opponent_score = Score.new
    opponent_score.user_id = params[:opponent_id]
    opponent_score.score = params[:opponent_score]
    opponent_score.save

    game.player_one_score_id = my_score.id
    game.player_two_score_id = opponent_score.id
    game.save

    redirect_to root_path
  end

end
