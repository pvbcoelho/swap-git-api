defmodule SwapGitAppWeb.ErrorView do
  use SwapGitAppWeb, :view
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

  def render("changeset.json", %{changeset: changeset}) do
    %{
      status: 422,
      message: "unprocessable_entity",
      description: "The given params failed in validation",
      errors: traverse_errors_to_list(Changeset.traverse_errors(changeset, &translate_error/1))
    }
  end

  def render("500.json", _assigns) do
    %{
      status: 500,
      message: "internal_server_error",
      description: "Internal Server Error",
      errors: []
    }
  end

  def template_not_found(template, _assigns) do
    %{errors: %{detail: Phoenix.Controller.status_message_from_template(template)}}
  end
end
