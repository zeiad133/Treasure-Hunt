# frozen_string_literal: true

class PatternWord < ApplicationRecord
  belongs_to :played_pattern
  belongs_to :word

  scope :correct, -> {
    where(is_correct: true)
  }
  scope :wrong, -> {
    where(is_correct: false)
  }
end
