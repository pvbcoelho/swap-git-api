# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :swap_git_app,
  ecto_repos: [SwapGitApp.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :swap_git_app, SwapGitAppWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: SwapGitAppWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: SwapGitApp.PubSub,
  live_view: [signing_salt: "HqHaz50s"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Tesla adapter
config :tesla, adapter: Tesla.Adapter.Hackney, recv_timeout: 30_000

config :swap_git_app, :git_base_url, base_url: System.get_env("GIT_BASE_URL")
# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
