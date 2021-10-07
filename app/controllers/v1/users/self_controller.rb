# frozen_string_literal: true

class V1::Users::SelfController < V1::Users::BaseController
  skip_before_action :fetch_user, only: [:registered]

  def update
    if @current_player.update(user_params)
      render(json: @current_player, status: :ok)
    else
      render(status: :unprocessable_entity, json: @current_player.errors)
    end
  end

  def show
    render(json: @current_player)
  end

  def registered
    return head(:not_found) if params[:player_id].blank?

    user = User.find_by(player_id: params[:player_id])
    if user.present?
      render(json: user, status: :ok)
    else
      head(:not_found)
    end
  end

  private

  def user_params
    params.require(:user).permit(:high_score, :puzzle_played, :total_life_time_score, :unique_pattern_played, :email)
  end
end
