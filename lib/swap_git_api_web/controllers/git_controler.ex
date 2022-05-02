defmodule SwapGitApiWeb.GitController do
  use SwapGitApiWeb, :controller
  require Logger
  alias SwapGitApi.Application.Handlers.ProcessHandler
  alias SwapGitApi.Application.Services.GitService
  alias SwapGitApi.Infrastructure.HttpClient.GitClient
  action_fallback SwapGitApiWeb.FallbackController

  def create_process(conn, %{"user" => user, "git_repository" => git_repository} = _params) do
    Logger.info("Start")

    with {:ok, _} <- GitClient.get_commits(user, git_repository, 1, 1),
         {:ok, response} <- GitService.create_process(user, git_repository) do
      conn
      |> put_status(:created)
      |> render("response.json", response: response)
    end
  end

  def check_process_status(conn, %{"process_id" => process_id} = _params) do
    with {:ok, response} <- ProcessHandler.get_process_by_processId(process_id) do
      conn
      |> put_status(:ok)
      |> render("response.json", response: response)
    end
  end
end
