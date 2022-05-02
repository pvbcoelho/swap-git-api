defmodule SwapGitApi.Application.Services.GitService do
  alias SwapGitApi.Application.Handlers.ContributorHandler
  alias SwapGitApi.Application.Handlers.IssueHandler
  alias SwapGitApi.Application.Handlers.OwnerHandler
  alias SwapGitApi.Application.Handlers.ProcessHandler
  alias SwapGitApi.Domain.Entities.Owner
  alias SwapGitApi.Infrastructure.Messaging.Publisher
  alias SwapGitApi.Infrastructure.Workers.CallbackWorker
  alias SwapGitApi.Infrastructure.Workers.WebHookWorker
  require Logger

  def create_process(user, git_repository) do
    Logger.info("GitService.create_process => start")
    {:ok, %Owner{} = owner} = OwnerHandler.save_owner(user, git_repository)

    data_msg = %{
      "process_id" => owner.process.id,
      "user" => owner.user,
      "git_repository" => owner.git_repository,
      "status" => "created"
    }

    Publisher.publish_message("SwapGitApi.Process.Created", data_msg)
    {:ok, data_msg}
  end

  def start_process(process_id, user, git_repository) do
    Logger.info("GitService.start_process => start")
    process = ProcessHandler.get_process_by_processId(process_id)

    reponse =
      [
        Task.async(fn ->
          ContributorHandler.get_contributors(process.owner_id, user, git_repository)
        end),
        Task.async(fn -> IssueHandler.get_issues(process.owner_id, user, git_repository) end)
      ]
      |> Enum.map(fn task -> Task.await(task, :infinity) end)

    ProcessHandler.update_process(process, %{"status" => "finalized"})
    CallbackWorker.schedule(WebHookWorker, %{owner_id: process.owner_id})
    reponse
  end

  def save_error(_payload) do
    :ok
  end
end
