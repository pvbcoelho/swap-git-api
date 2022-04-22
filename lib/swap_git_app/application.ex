defmodule SwapGitApp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      SwapGitApp.Repo,
      # Start the Telemetry supervisor
      SwapGitAppWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: SwapGitApp.PubSub},
      # Start the Endpoint (http/https)
      SwapGitAppWeb.Endpoint
      # Start a worker by calling: SwapGitApp.Worker.start_link(arg)
      # {SwapGitApp.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SwapGitApp.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SwapGitAppWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
