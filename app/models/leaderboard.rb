# frozen_string_literal: true

class Leaderboard < ApplicationRecord
  validates_presence_of :score
  belongs_to :user
  belongs_to :pattern

  scope :by_pattern_code, -> (code) { joins(:pattern).where(patterns: { code: code }) }
  scope :top_ten, -> { order(score: :desc).limit(10) }
  scope :top_ten_by_code, -> (code) {
    by_pattern_code(code).top_ten
  }
end
