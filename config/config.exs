# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :texas_application, TexasApplication.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "bu+clU+4H2jCaHNxQ5JicgmHQY/QUJSJySHmyt28W/3Fs+uV1tQLecUZCEPCAuwc",
  render_errors: [view: TexasApplication.ErrorView, accepts: ~w(html json)],
  pubsub: [name: TexasApplication.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :template_engines,
  ratchet: Ratchet.Phoenix.Engine

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
