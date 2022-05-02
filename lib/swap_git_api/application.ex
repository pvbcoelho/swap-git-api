defmodule SwapGitApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      SwapGitApi.Repo,
      # Start the Telemetry supervisor
      SwapGitApiWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: SwapGitApi.PubSub},
      # Start the Endpoint (http/https)
      SwapGitApiWeb.Endpoint,
      %{
        id: SwapGitApi.Infrastructure.Messaging.Publisher,
        start: {SwapGitApi.Infrastructure.Messaging.Publisher, :start_link, []}
      },
      %{
        id: SwapGitApi.Infrastructure.Messaging.Consumer,
        start: {SwapGitApi.Infrastructure.Messaging.Consumer, :start_link, []}
      },
      {Oban, oban_config()}
    ]

    :logger.add_primary_filter(
      :ignore_rabbitmq_progress_reports,
      {&:logger_filters.domain/2, {:stop, :equal, [:progress]}}
    )

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SwapGitApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    SwapGitApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end

  defp oban_config do
    Application.fetch_env!(:swap_git_api, Oban)
  end
end
