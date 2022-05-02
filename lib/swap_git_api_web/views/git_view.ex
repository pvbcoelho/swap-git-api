defmodule SwapGitApiWeb.GitView do
  use SwapGitApiWeb, :view

  def render("response.json", %{response: response}) do
    response
  end
end
