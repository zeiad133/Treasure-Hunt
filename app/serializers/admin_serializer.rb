# frozen_string_literal: true

class AdminSerializer < ActiveModel::Serializer
  attributes :id, :name, :email
  attributes :provider, :uid, :allow_password_change
end
