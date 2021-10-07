# frozen_string_literal: true

class Word < ApplicationRecord
  validates_uniqueness_of :name
  has_many :pattern_words
end
