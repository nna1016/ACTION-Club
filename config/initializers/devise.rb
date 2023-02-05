Devise.setup do |config|
  config.scoped_views = true
  require 'devise/orm/active_record'
  config.omniauth :google_oauth2,"760783727319-thvgm7kpad3oi5al8ag87bg8ghei0p5l.apps.googleusercontent.com","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",name: :google,scope: %w(email) 
  # ==> Scopes configuration
  # Turn scoped views on. Before rendering "sessions/new", it will first check for
  # "users/sessions/new". It's turned off by default because it's slower if you
  # are using only default views.
end