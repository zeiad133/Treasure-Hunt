# frozen_string_literal: true

class PlayedPatternSerializer < ActiveModel::Serializer
  attributes :id
  has_many :correct_words
  has_many :wrong_words
  belongs_to :pattern
end
