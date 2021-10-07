# frozen_string_literal: true

class Treasure < ApplicationRecord
  acts_as_mappable default_units: :kms,
  lat_column_name: :lat,
  lng_column_name: :lng
  validates_presence_of :lat, :lng

end
