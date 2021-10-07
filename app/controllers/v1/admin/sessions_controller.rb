# frozen_string_literal: true

class V1::Admin::SessionsController < DeviseTokenAuth::SessionsController
  protected

  def render_create_success
    update_auth_header
    render(json: @resource)
  end
end
