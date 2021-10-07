# frozen_string_literal: true

class V1::Admin::AdminsController < V1::Admin::BaseController
  before_action :set_admin, only: %i(show destroy update)

  def index
    admins = Admin.all
    paginate(collection: admins)
  end

  def show
    render(json: @admin)
  end

  def create
    admin = Admin.create_without_password(admin_params)
    if admin.save
      admin.send_invitation
      render(json: admin, status: :created)
    else
      render(status: :unprocessable_entity, json: admin.errors)
    end
  end

  def update
    if @admin.update(admin_params.except(:email))
      render(json: @admin, status: :ok)
    else
      render(status: :unprocessable_entity, json: @admin.errors)
    end
  end

  def destroy
    @admin.destroy
  end

  private

  def set_admin
    @admin = Admin.find(params[:id])
  end

  def admin_params
    params.require(:admin).permit(:name, :email)
  end
end
