# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
=begin
ActionController::Base.session = {
  :key         => '_workout_session',
  :secret      => 'a835a944185c49e078a52ed36a75744770d7cf8c85f5919d4d9f145f4b904217fd3404dac76a356fc432dffa05645c372cd7474609c8005da5bdc2de64c35052'
}
=end
# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

