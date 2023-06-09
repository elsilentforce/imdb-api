Sidekiq.strict_args!(false)

Sidekiq.configure_client do |config|
  config.redis = { url: "redis://localhost:6379/1", size: 2, network_timeout: 5 }
end

Sidekiq.configure_server do |config|
  config.redis = { url: "redis://localhost:6379/1", size: 2, network_timeout: 5 }
end
