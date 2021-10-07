# frozen_string_literal: true

class V1::Admin::ConfirmationsController < V1::Admin::BaseController
  skip_before_action :authenticate_admin!

  def show
    admin = Admin.find_by_confirmation_token(params[:confirmation_token])
    render json: admin
  end

  def create
    admin = Admin.find_by_email(params[:email])
    if admin.present?
      admin.send_invitation
      render(json: { message: 'email has been sent' })
      head(:ok)
    else
      head(:not_found)
    end
  end

  def update
    admin = Admin.find_by_confirmation_token(params[:confirmation_token])

    if admin.nil?
      head(:not_found)
    elsif admin.update(admin_params)
      admin.confirm
      render(status: :created, json: admin)
    else
      render(json: admin.errors, status: :unprocessable_entity)
    end
  end

  private

  def admin_params
    params.require(:admin).permit(:name, :password, :password_confirmation)
  end
end
