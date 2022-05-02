defmodule SwapGitApiWeb.ErrorView do
  use SwapGitApiWeb, :view
  alias Ecto.Changeset

  def render("400.json", _assigns) do
    %{
      status: 400,
      message: "bad_request",
      description: "The request is malformed",
      errors: []
    }
  end

  def render("404.json", _assigns) do
    %{
      status: 404,
      message: "not_found",
      description: "User or repository not found"
    }
  end

  def render("422.json", _assigns) do
    %{
      status: 422,
      message: "unhadle error",
      description: "unhadle error"
    }
  end

  def render("changeset.json", %{changeset: changeset}) do
    %{
      status: 422,
      message: "unprocessable_entity",
      description: "The given params failed in validation",
      errors: traverse_errors_to_list(Changeset.traverse_errors(changeset, &translate_error/1))
    }
  end
end
