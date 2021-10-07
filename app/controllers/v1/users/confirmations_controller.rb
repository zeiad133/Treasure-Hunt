# frozen_string_literal: true

class V1::Users::ConfirmationsController < V1::Users::BaseController
  skip_before_action :authenticate_user!

  def create
    user = User.find_by_email(params[:email])

    if user.present?
      user.send_invitation
      render(json: { message: 'email has been sent' })
      head(:ok)
    else
      head(:not_found)
    end
  end

  def update
    user = User.find_by_confirmation_token(params[:confirmation_token])

    if user.nil?
      head(:not_found)
    elsif user.update(user_params)
      user.confirm
      render(status: :ok, json: user)
    else
      render(json: user.errors, status: :unprocessable_entity)
    end
  end

  def confirm
    user = User.find_by_confirmation_token(params[:confirmation_token])
    if user.nil?
      head(:not_found)
    else
      user.confirm
      render(status: :ok, json: user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :age, :phone_number, :password, :password_confirmation)
  end
end
