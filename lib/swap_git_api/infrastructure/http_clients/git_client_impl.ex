defmodule SwapGitApi.Infrastructure.HttpClient.GitClientImpl do
  @moduledoc """
  This module is responsable for determinate Client HTTP to Git API
  """
  require Logger

  use SwapGitApi.Infrastructure.HttpClients.GenericClient,
    base_url_key: :git_base_url

  @behaviour SwapGitApi.Infrastructure.HttpClient.GitClient

  plug Tesla.Middleware.Headers, [
    {"content-type", "application/json"},
    {"accept", "*/*"},
    {"Authorization",
     "Basic cHZiY29lbGhvOmdocF9weVpKMGpXUFpBMXhwZFZnT1NkT3VINWwxQ3F5Q0UwYUZhTUk="}
  ]

  plug(Tesla.Middleware.JSON)

  def get_issues(owner, repo, page, quantity_per_page) do
    "/repos/#{owner}/#{repo}/issues?page=#{page}&per_page=#{quantity_per_page}"
    |> get()
    |> handle_response()
  end

  def get_commits(owner, repo, page, quantity_per_page) do
    "/repos/#{owner}/#{repo}/commits?page=#{page}&per_page=#{quantity_per_page}"
    |> get()
    |> handle_response()
  end
end
