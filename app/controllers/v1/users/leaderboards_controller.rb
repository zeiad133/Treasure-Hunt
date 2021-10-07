# frozen_string_literal: true

class V1::Users::LeaderboardsController < V1::Users::BaseController
  before_action :set_pattern, only: %i(create)
  skip_before_action :fetch_user, only: %i(index)
  def index
    leaderboards = Leaderboard.all
    leaderboards = Leaderboard.top_ten_by_code(params[:code]) if params[:code]
    paginate(collection: leaderboards)
  end

  def show
  end

  def create
    leaderboard = Leaderboard.find_or_initialize_by(user_id: @current_player.id, pattern_id: @pattern.id)
    current_score = leaderboard.score || 0
    leaderboard.score = [leaderboard_params[:score], current_score].max
    if leaderboard.save
      render(json: Leaderboard.top_ten_by_code(params[:code]), status: :created)
    else
      render(json: leaderboard.errors, status: :unprocessable_entity)
    end
  end

  private

  def set_pattern
    @pattern = Pattern.find_by_code!(params[:code])
  end

  def leaderboard_params
    params.require(:leaderboard).permit(:score)
  end
end
