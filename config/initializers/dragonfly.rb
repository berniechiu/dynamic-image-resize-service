require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret "409a448167b6ebff07acdaf3ee8d2d037b06671862159a81ee590c5c228ee47c"

  # url_host 'http://some.cdn'
  url_format "/media/:job/:sha/:name"

  datastore :file,
    root_path: Rails.root.join('public/system/dragonfly', Rails.env),
    server_root: Rails.root.join('public')
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end
