# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_bikesmarketplace_session',
  :secret      => '5b2d1a94b57e0cf8d923e0973db8824acedcbb42521979ee2fa06ecd487d77b68b93cd19e367d718fc72c6c8085f5b8f56feb1dd2e2abcb6a6bf4706cf337929'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
