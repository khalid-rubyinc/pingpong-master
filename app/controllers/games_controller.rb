class GamesController < ApplicationController

  def create
    game = Game.new

    game.played_at = DateTime.new(
      params[:game]['played_at(1i)'].to_i,
      params[:game]['played_at(2i)'].to_i,
      params[:game]['played_at(3i)'].to_i
    )

    my_score = Score.new
    my_score.user_id = current_user.id
    my_score.score = params[:score]
    my_score.save

    opponent_score = Score.new
    opponent_score.user_id = params[:opponent_id]
    opponent_score.score = params[:opponent_score]
    opponent_score.save

    if my_score.valid? && opponent_score.valid?
      game.player_one_score_id = my_score.id
      game.player_two_score_id = opponent_score.id
      game.save
    end

    flash[:errors] =  (game.errors.full_messages +
                      my_score.errors.full_messages +
                      opponent_score.errors.full_messages).join('<br/>')

    if game.invalid?
      my_score.destroy
      opponent_score.destroy
    end

    redirect_to root_path
  end

end
