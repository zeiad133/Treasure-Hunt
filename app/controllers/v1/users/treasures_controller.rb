# frozen_string_literal: true

class V1::Users::TreasuresController < V1::Users::BaseController
  before_action :set_treasure, only: [:hunt]

  def hunt
    result = Hunt.call(
      current_location: treasure_params[:current_location],
      treasure: @treasure,
      user: current_user)
    if result.success?
      render(json: {distance: result.distance, msg: result.message})
    else
      render(json: {errors: result.errors, distance: -1}, status: :unprocessable_entity)
    end
  end

  

  private

  def treasure_params
    params.permit(current_location: [])
  end

  def set_treasure
    @treasure = Treasure.first_or_create(lat: '19.945704' , lng: '50.051227')
  end
end
