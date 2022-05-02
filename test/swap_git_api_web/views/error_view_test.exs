defmodule SwapGitApiWeb.ErrorViewTest do
  use SwapGitApiWeb.ConnCase, async: true

  # Bring render/3 and render_to_string/3 for testing custom views
  import Phoenix.View

  test "renders 400.json" do
    assert render(SwapGitApiWeb.ErrorView, "400.json", []) == %{
             status: 400,
             message: "bad_request",
             description: "The request is malformed",
             errors: []
           }
  end

  test "renders 404.json" do
    assert render(SwapGitApiWeb.ErrorView, "404.json", []) == %{
             description: "User or repository not found",
             message: "not_found",
             status: 404
           }
  end

  test "renders 422.json" do
    assert render(SwapGitApiWeb.ErrorView, "422.json", []) == %{
             status: 422,
             message: "unhadle error",
             description: "unhadle error"
           }
  end
end
