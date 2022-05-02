defmodule SwapGitApi.Infrastructure.HttpClient.GitClient do
  @moduledoc """
  This module is responsable for determinate Client HTTP to Git API
  """

  @callback get_issues(String.t(), String.t(), integer(), integer()) ::
              {:ok, list()} | {:error, any}

  @callback get_commits(String.t(), String.t(), integer(), integer()) ::
              {:ok, list()} | {:error, any}

  def get_issues(owner, repo, page, quantity_per_page) do
    get_impl().get_issues(owner, repo, page, quantity_per_page)
  end

  def get_commits(owner, repo, page, quantity_per_page) do
    get_impl().get_commits(owner, repo, page, quantity_per_page)
  end

  def get_impl() do
    Application.get_env(:swap_git_api, :git_client_impl)
  end
end
