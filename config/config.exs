# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

# This configuration is loaded before any dependency and is restricted
# to this project. If another project depends on this project, this
# file won't be loaded nor affect the parent project. For this reason,
# if you want to provide default values for your application for third-
# party users, it should be done in your mix.exs file.

config :flowdock,
  organization: "FILL_ME_IN",
  flow: "FILL_ME_IN",
  username: "FILL_ME_IN",
  password: "FILL_ME_IN"

import_config "#{Mix.env}.exs"
