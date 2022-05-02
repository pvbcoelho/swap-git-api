defmodule SwapGitApi.Infrastructure.Workers.WebHookWorker do
  @behaviour SwapGitApi.Infrastructure.Workers.CallbackWorker
  require Logger

  use Oban.Worker,
    queue: :webhook,
    max_attempts: 1,
    tags: ["callback", "webhook", "github"]

  alias SwapGitApi.Application.Handlers.OwnerHandler
  alias SwapGitApi.Infrastructure.HttpClient.WebhookClient
  alias SwapGitApi.Infrastructure.Workers.WebHookWorker
  @one_day 60 * 60 * 24

  @impl true
  def schedule(%{owner_id: owner_id}) do
    %{owner_id: owner_id}
    |> WebHookWorker.new(schedule_in: @one_day)
    |> Oban.insert()
  end

  @impl Oban.Worker
  def perform(%Oban.Job{args: %{"owner_id" => owner_id}}) do
    owner = OwnerHandler.get_owner_by_ownerId(owner_id)

    case WebhookClient.send_message(owner) do
      {:ok, _} ->
        Logger.info("WebhookWorker executed successfuly")
        :ok

      error ->
        Logger.error("Error executing webhook worker")
        error
    end
  end
end
