defmodule SwapGitApi.Infrastructure.Messaging.Consumer do
  @moduledoc """
  This module is responsable for determinate Message Consumer
  """

  require Logger

  alias GenRMQ.Consumer
  alias SwapGitApi.Application.Services.GitService

  @behaviour GenRMQ.Consumer

  def init do
    [
      queue: Application.get_env(:swap_git_api, :messages)[:queue_name],
      exchange: Application.get_env(:swap_git_api, :messages)[:exchange_name],
      routing_key: "SwapGitApi.Process.Created",
      deadletter_routing_key: "SwapGitApi.Process.Created",
      prefetch_count: "10",
      terminate_timeout: 120_000,
      connection: Application.get_env(:swap_git_api, :rabbitmq),
      reconnect_attempt: 10,
      handle_message_timeout: 120_000,
      retry_delay_function: fn attempt -> :timer.sleep(2000 * attempt) end
    ]
  end

  def consumer_tag do
    {:ok, hostname} = :inet.gethostname()
    "#{hostname}-swap-consumer"
  end

  def handle_message(%GenRMQ.Message{payload: payload} = message) do
    {:ok, data} = Jason.decode(payload)

    %{"data" => %{"process_id" => process_id, "user" => user, "git_repository" => git_repository}} =
      data

    Logger.info(
      "[SwapGitApi.Infrastructure.Messaging.Consumer]{handle_message} -> Message acquired"
    )

    Logger.metadata(process_id: process_id)
    Logger.info("[SwapGitApi.Infrastructure.Messaging.Consumer]{handle_message} -> Start")
    GitService.start_process(process_id, user, git_repository)
    Consumer.ack(message)
  rescue
    error ->
      Logger.error(
        "[SwapGitApi.Infrastructure.Messaging.Consumer]{handle_message} Rescue error: #{inspect(error)}"
      )
  end

  def handle_error(message, reason) do
    Logger.error("[SwapGitApi.Infrastructure.Messaging.Consumer] ERROR: #{inspect(message)}")
    Logger.error("[SwapGitApi.Infrastructure.Messaging.Consumer] REASON: #{inspect(reason)}")
    Consumer.reject(message, false)
  end

  def start_link do
    Consumer.start_link(__MODULE__, name: __MODULE__)
  end
end
