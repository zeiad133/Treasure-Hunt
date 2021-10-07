# frozen_string_literal: true

class V1::Users::RegistrationsController < DeviseTokenAuth::RegistrationsController
  def render_create_success
    render json: @resource
  end

  def render_update_success
    render json: @resource
  end

  def create
    user = User.new(user_params)
    if user.save
      render(json: user, status: :created)
    else
      render(json: user.errors, status: :unprocessable_entity)
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
