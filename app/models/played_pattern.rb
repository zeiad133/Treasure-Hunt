# frozen_string_literal: true

class PlayedPattern < ApplicationRecord
  has_many :pattern_words
  belongs_to :user
  belongs_to :pattern

  has_many :correct_words, -> { PatternWord.correct }, through: :pattern_words, source: :word
  has_many :wrong_words, -> { PatternWord.wrong }, through: :pattern_words, source: :word
end
