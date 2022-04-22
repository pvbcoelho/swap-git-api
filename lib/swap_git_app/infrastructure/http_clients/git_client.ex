defmodule SwapGitApp.Infrastructure.HttpClient.GitClient do
  @moduledoc """
  This module is responsable for determinate Client HTTP to Git API
  """
  require Logger

  use SwapGitApp.Infrastructure.HttpClients.GenericClient,
    base_url_key: :git_base_url

  plug Tesla.Middleware.Headers, [{"content-type", "application/json"}, {"accept", "*/*"}]
  plug(Tesla.Middleware.JSON)

  def get_issues(user, git_repository) do
    response =
      "/repos/#{user}/#{git_repository}/issues"
      |> get()
      |> handle_response()

    Logger.info("response: #{inspect(response)}")
    response
  end
end
