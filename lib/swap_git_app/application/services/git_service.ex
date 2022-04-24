defmodule SwapGitApp.GitService do
  alias SwapGitApp.Infrastructure.HttpClient.GitClient

  def create_process(owner, repo) do
    GitClient.get_commits(owner, repo, 1)
  end
end
