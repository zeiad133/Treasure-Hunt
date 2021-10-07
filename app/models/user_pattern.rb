# frozen_string_literal: true

class UserPattern < ApplicationRecord
  belongs_to :pattern
  belongs_to :user
  validates_uniqueness_of :user_id, scope: :pattern_id
end
