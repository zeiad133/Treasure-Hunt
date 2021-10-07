# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def send_treasure_details(user, treasure)
    @user = user
    @treasure = treasure
    mail(to: @user.email, subject: 'You have found the treasure')
  end
end
