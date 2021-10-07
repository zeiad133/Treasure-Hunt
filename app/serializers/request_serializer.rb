# frozen_string_literal: true

class RequestSerializer < ActiveModel::Serializer
  attributes :current_location, :email, :created_at

  def current_location
    [object.lat, object.lng]
  end

  def email
    object.user.email
  end
end
