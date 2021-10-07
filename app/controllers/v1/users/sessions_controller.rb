# frozen_string_literal: true

class V1::Users::SessionsController < DeviseTokenAuth::SessionsController
  protected

  def render_create_success
    render json: @resource
  end
end
