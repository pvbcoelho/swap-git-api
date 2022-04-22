defmodule SwapGitAppWeb.GitView do
  use SwapGitAppWeb, :view

  def render("create_process.json", %{response: response}) do
    response
  end
end
