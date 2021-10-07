Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://redis:6379/0', namespace: "Treasure_hunt_sidekiq_#{Rails.env}" }
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://redis:6379/0', namespace: "Treasure_hunt_sidekiq_#{Rails.env}" }
end
