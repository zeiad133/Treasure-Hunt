# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { "user_#{SecureRandom.hex}@example.com" }
    password { 'password' }
  end
end
