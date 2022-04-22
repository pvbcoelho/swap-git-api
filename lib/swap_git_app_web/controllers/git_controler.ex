defmodule SwapGitAppWeb.GitController do
  use SwapGitAppWeb, :controller

  alias SwapGitApp.GitService
  action_fallback SwapGitAppWeb.FallbackController

  def create_process(conn, %{"user" => user, "git_repository" => git_repository} = params) do
    with {:ok, response} <- GitService.create_process(user, git_repository) do
      conn
      |> put_status(:created)
      |> render("create_process.json", response: response)
    end
  end
end
