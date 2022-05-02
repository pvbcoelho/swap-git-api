import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :swap_git_api, SwapGitApi.Repo,
  username: "postgres",
  password: "postgres",
  database: "swap_git_api_test",
  hostname: "postgres",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :swap_git_api, SwapGitApiWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "ixa0v/ktQBe7yuu55dRbfaaKKtxV7k+PArnIX6FL9QZeu36K+kdL2DXtL1IFd6+6",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

config :swap_git_api, Oban, queues: false, plugins: false

config :swap_git_api, git_client_impl: SwapGitApi.Test.Mocks.GitClientImplMock

config :swap_git_api, :rabbitmq,
  host: System.get_env("MQ_HOST") || "localhost",
  port: "5672",
  username: "rabbit",
  password: "rabbit"

config :swap_git_api, :messages,
  exchange_name: "swap.git.api.exchange_test",
  queue_name: "swap.git.api.queue",
  retries: 10
