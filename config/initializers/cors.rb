Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'
    resource '*',
             headers: %w[Authorization],
             expose: %w[Authorization],
             max_age: 600,
             methods: %i[get post put patch delete options head]
  end
end
