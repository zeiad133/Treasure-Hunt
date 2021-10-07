# frozen_string_literal: true

class V1::Users::PlayersController < V1::Users::BaseController
  before_action :set_player, only: %i(show)

  def index
    players = User.all
    players = players.search(params[:query]) if params[:query].present?

    paginate(collection: players)
  end

  def show
    render(json: @player)
  end

  private

  def set_player
    @player = User.find(params[:id])
  end
end
