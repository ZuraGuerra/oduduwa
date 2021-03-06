# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :oduduwa, Oduduwa.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "lx9hxpvpLe9ClegwRnoj2JIdiiof0uTVmXD2aLAYLML9DgNS8iwTKbp/UKbr72Rb",
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: Oduduwa.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configures Elegua
config :elegua,
  user_model: Oduduwa.Mambo,
  password_field: :magic_word,
  username_field: :baptismal_name,
  email_field: :spiritual_mailbox

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false
