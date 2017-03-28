require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret ENV['DRAGON_FLY_SECRET']

  # url_host 'http://some.cdn'
  url_format "/media/:job/:sha/:name"

  processor :resize do |content, dimensions, *args|
    args    = args.first || {}
    format  = args[:format] || 'jpeg'
    quality = args[:quality] || 70
    #   convert -resize 80x80 -format jpg -quality 70
    content.process! :convert, "-resize #{dimensions} -format #{format} -quality #{quality}"
  end

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
