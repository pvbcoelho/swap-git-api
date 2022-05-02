defmodule SwapGitApi.Infrastructure.Messaging.Publisher do
  @moduledoc """
  This module is responsable for determinate Message Publisher
  """
  @behaviour GenRMQ.Publisher

  require Logger

  alias Ecto.UUID
  alias GenRMQ.Publisher

  def start_link do
    Publisher.start_link(__MODULE__, name: __MODULE__)
  end

  def init do
    [
      exchange: Application.get_env(:swap_git_api, :messages)[:exchange_name],
      connection: Application.get_env(:swap_git_api, :rabbitmq)
    ]
  end

  def publish_message(event_type, message) do
    Logger.info("[SwapGitApi.Infrastructure.Messaging.Publisher]{publish_message} start")

    msg = %{
      event_id: UUID.generate(),
      correlation_id: UUID.generate(),
      timestamp: DateTime.utc_now() |> DateTime.to_unix(:millisecond),
      event_type: event_type,
      data: message
    }

    metadata = [message_id: msg[:event_id], correlation_id: msg[:correlation_id]]
    {:ok, json} = Jason.encode(msg)

    Logger.info(
      "[SwapGitApi.Infrastructure.Messaging.Publisher]{publish_message} JSON encoded message: #{inspect(json)}"
    )

    :ok = Publisher.publish(__MODULE__, json, event_type, metadata)

    Logger.info(
      "[SwapGitApi.Infrastructure.Messaging.Publisher]{publish_message} message published successfully"
    )
  end

  def publish_retry_message(routing_key, message, headers) do
    {:ok, payload} = Jason.decode(message)

    metadata = [
      message_id: payload["event_id"],
      correlation_id: payload["correlation_id"]
    ]

    :ok = Publisher.publish(__MODULE__, Jason.encode!(payload), routing_key, metadata ++ headers)
  end
end
