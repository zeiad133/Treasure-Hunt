# frozen_string_literal: true

class V1::Admin::UsersController < V1::Admin::BaseController
  before_action :set_user, only: %i(show update destroy confirm)

  def index
    @users = User.all
    paginate(collection: @users)
  end

  def show
    render(json: @user)
  end

  def create
    user = User.create_without_password(user_params)

    if user.save
      user.send_invitation
      render(json: user, status: :created)
    else
      render(status: :unprocessable_entity, json: user.errors)
    end
  end

  def update
    if @user.update(user_params.except(:email))
      render(json: @user, status: :ok)
    else
      render(status: :unprocessable_entity, json: @user.errors)
    end
  end

  # CONFIRM /users/1
  def confirm
    @user.confirm
    @user.send_confirmation_notification
    render(json: @user, status: :ok)
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :program_id)
  end
end
