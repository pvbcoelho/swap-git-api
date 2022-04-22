defmodule SwapGitApp.GitService do
  alias SwapGitApp.Infrastructure.HttpClient.GitClient

  def create_process(user, git_repository) do
    GitClient.get_issues(user, git_repository)
  end
end
