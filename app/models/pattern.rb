# frozen_string_literal: true

class Pattern < ApplicationRecord
  validates_presence_of :code
  validates_uniqueness_of :code
end
