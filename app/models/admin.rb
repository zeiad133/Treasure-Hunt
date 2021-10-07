# frozen_string_literal: true

class Admin < ActiveRecord::Base # :confirmable, :lockable, :timeoutable and :omniauthable
  # Include default devise modules. Others available are:
  devise :database_authenticatable,
    :registerable,
    :confirmable,
    :recoverable,
    :rememberable,
    :trackable,
    :validatable
  include DeviseTokenAuth::Concerns::User

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end

  def self.create_without_password(admin_params)
    create(admin_params.merge(password: SecureRandom.hex))
  end

  def send_password_reset_instructions
    set_reset_password_token
    AdminMailer.send_admin_password_reset_instructions(self).deliver_later
  end

  def send_invitation
    generate_confirmation_token
    AdminMailer.send_admin_invitation_instructions(self).deliver_later
  end
end
