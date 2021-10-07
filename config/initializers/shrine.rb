# frozen_string_literal: true

require 'shrine'
require 'shrine/storage/s3'
require 'shrine/storage/file_system'

if Rails.env.development? || Rails.env.test?
  Shrine.storages = {
    cache: Shrine::Storage::FileSystem.new('public', prefix: 'uploads/cache'),
    store: Shrine::Storage::FileSystem.new('public', prefix: 'uploads/store'),
  }
  Shrine.plugin :url_options, store: { host: ENV.fetch('DOMAIN_URL') }
else
  s3_options = {
    access_key_id: ENV.fetch('S3_KEY'),
    secret_access_key: ENV.fetch('S3_SECRET'),
    bucket: ENV.fetch('S3_BUCKET'),
    endpoint: ENV.fetch('S3_ENDPOINT'),
    region: ENV.fetch('S3_REGION'),
  }

  Shrine.storages = {
    store: Shrine::Storage::S3.new(prefix: "#{ENV.fetch('S3_PATH')}uploads/store", **s3_options),
    cache: Shrine::Storage::FileSystem.new('public', prefix: 'uploads/cache'),
  }
  Shrine.plugin :url_options, store: { host: ENV.fetch('S3_URL') }
end

Shrine.plugin :activerecord
Shrine.plugin :cached_attachment_data
Shrine.plugin :pretty_location
Shrine.plugin :remove_invalid
