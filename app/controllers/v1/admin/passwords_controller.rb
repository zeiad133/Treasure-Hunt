# frozen_string_literal: true

class V1::Admin::PasswordsController < V1::Admin::BaseController
  skip_before_action :authenticate_admin!

  def create
    admin = Admin.find_by_email(params[:email])
    if admin.present?
      admin.send_password_reset_instructions
      head(:ok)
    else
      head(:not_found)
    end
  end

  def update
    admin = Admin.find_by_reset_password_token(params[:reset_password_token])

    if admin.nil?
      head(:not_found)
    elsif admin.reset_password(params[:password], params[:password_confirmation])
      head(:ok)
    else
      render(json: admin.errors, status: :unprocessable_entity)
    end
  end
end
