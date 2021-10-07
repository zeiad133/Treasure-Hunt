# frozen_string_literal: true

class V1::Users::PasswordsController < V1::Users::BaseController
  skip_before_action :authenticate_user!

  def create
    user = User.find_by_email(params[:email])
    if user.present?
      user.send_password_reset_token
      head(:ok)
    else
      head(:not_found)
    end
  end

  def update
    user = User.find_by_reset_password_token(params[:reset_password_token])

    if user.nil?
      head(:not_found)
    elsif user.reset_password(params[:password], params[:password_confirmation])
      head(:ok)
    else
      render(json: user.errors, status: :unprocessable_entity)
    end
  end
end
