defmodule SwapGitApp.Infrastructure.HttpClient.GitClient do
  @moduledoc """
  This module is responsable for determinate Client HTTP to Git API
  """
  require Logger

  use SwapGitApp.Infrastructure.HttpClients.GenericClient,
    base_url_key: :git_base_url

  plug Tesla.Middleware.Headers, [
    {"content-type", "application/json"},
    {"accept", "*/*"},
    {"Authorization",
     "Basic cHZiY29lbGhvOmdocF8zNmU5TFBvRmxJV1ZES09HTW13RmpvUG5NRlRkRWQyVmtReUs="}
  ]

  plug(Tesla.Middleware.JSON)

  def get_issues(owner, repo) do
    response =
      "/repos/#{owner}/#{repo}/issues"
      |> get()
      |> handle_response()

    response
  end

  def get_commits(owner, repo, page) do
    response =
      "/repos/#{owner}/#{repo}/commits?per_page=100&page=#{page}"
      |> get()
      |> handle_response()

    response
  end

  def get_branches(owner, repo) do
    response =
      "/repos/#{owner}/#{repo}/branches"
      |> get()
      |> handle_response()

    response
  end
end
