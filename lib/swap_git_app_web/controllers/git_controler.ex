defmodule SwapGitAppWeb.GitController do
  use SwapGitAppWeb, :controller

  alias SwapGitApp.GitService
  action_fallback SwapGitAppWeb.FallbackController

  def create_process(conn, %{"owner" => owner, "repo" => repo} = _params) do
    with {:ok, response} <- GitService.create_process(owner, repo) do
      conn
      |> put_status(:created)
      |> render("create_process.json", response: response)
    end
  end
end
