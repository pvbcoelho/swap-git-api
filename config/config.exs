# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :swap_git_api,
  ecto_repos: [SwapGitApi.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :swap_git_api, SwapGitApiWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: SwapGitApiWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: SwapGitApi.PubSub,
  live_view: [signing_salt: "HqHaz50s"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :phoenix, :logger, false

# Tesla adapter
config :tesla, adapter: Tesla.Adapter.Hackney, recv_timeout: 30_000

config :swap_git_api, :git_base_url, base_url: System.get_env("GIT_BASE_URL")

config :swap_git_api, Oban,
  repo: SwapGitApi.Repo,
  plugins: [Oban.Plugins.Pruner],
  queues: [webhook: 10]

config :swap_git_api, :rabbitmq,
  host: System.get_env("MQ_HOST"),
  port: System.get_env("MQ_PORT"),
  username: System.get_env("MQ_USER"),
  password: System.get_env("MQ_PASSWORD")

config :swap_git_api, :messages,
  exchange_name: System.get_env("MQ_EXCHANGE_NAME"),
  queue_name: System.get_env("MQ_QUEUE_NAME"),
  retries: String.to_integer(System.get_env("MQ_RETRIES") || "10")

config :swap_git_api, git_client_impl: SwapGitApi.Infrastructure.HttpClient.GitClientImpl

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
