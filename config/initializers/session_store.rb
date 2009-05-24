# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_japac_session',
  :secret      => 'e4dae0e41b05e27583bc9aea4de8b84d16c5a4e92a3991433e89cbb2240087083830b10abeebe57c4f50e0774e82bde7f635198edf99f438165846f61c3ac909'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
