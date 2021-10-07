# frozen_string_literal: true

class V1::Users::TokenValidationsController < DeviseTokenAuth::TokenValidationsController
  protected

  def render_validate_token_success
    render json: @resource
  end
end
