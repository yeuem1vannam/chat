# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Chat::Application.config.secret_key_base = '1853c17cfcd950d09ebcc30c4aaa722bf04bf43db67cc7189b3f082669d89ddb1f9c23836a1d31c5f48853568bfed1443f04d26706a92c91ac4947a9cc032123'
