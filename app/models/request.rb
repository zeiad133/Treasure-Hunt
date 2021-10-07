# frozen_string_literal: true

class Request < ApplicationRecord
  acts_as_mappable default_units: :kms,
  lat_column_name: :lat,
  lng_column_name: :lng
  validates_presence_of :lat, :lng
  belongs_to :user

  scope :by_created_at_since, ->(date) {
    where('created_at >= :date', date: date.to_date.beginning_of_day)
  }

  scope :by_created_at_until, ->(date) {
    where('created_at <= :date', date: date.to_date.end_of_day)
  }

  scope :by_radius, ->(radius) {
    within(radius, units: :kms, origin: Treasure.first)
  }
  scope :this_hour, -> {
    where(
      created_at: (Time.now - 1.hours)..Time.now
    )
  }

end
