# frozen_string_literal: true

class User < ActiveRecord::Base # :confirmable, :lockable, :timeoutable and :omniauthable
  # Include default devise modules. Others available are:
  devise :database_authenticatable,
    :registerable,
    # :confirmable,
    :recoverable,
    :rememberable,
    :trackable,
    :validatable,
    authentication_keys: %i(email)

  include DeviseTokenAuth::Concerns::User
  validates_presence_of :email
  validates_uniqueness_of :email, case_sensitive: true



  def sync_uid
    self.uid = email
  end

  def send_password_reset_token
    set_reset_password_token
    # UserMailer.send_password_reset_token(self).deliver_later
  end
end
