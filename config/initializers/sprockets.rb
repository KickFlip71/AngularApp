# config/initializers/sprockets.rb
# register .slim for assets pipeline
Rails.application.config.assets.configure do |env|
  env.register_engine('.slim', Slim::Template)
  env.register_mime_type 'text/html', '.html'
end
