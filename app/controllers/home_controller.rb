class HomeController < ApplicationController
  def index
    users = User.all

    # Sorts by alphabetic name
    # Then sorts by number of games played
    # Then sorts by the highest score
    @leaderboard = User.all.map do |user|
      [ user.name,
        user.scores.sum(&:score),
        user.scores.count ]
    end.sort_by(&:first).sort_by(&:third).reverse.sort_by(&:second).reverse
    # Could improve alogorithm to account for not all wins should count the same.
  end

  def history
    @scores = current_user.scores
  end

  def log
    @game = Game.new
  end
end
