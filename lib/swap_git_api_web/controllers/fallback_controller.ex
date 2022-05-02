defmodule SwapGitApiWeb.FallbackController do
  @moduledoc """
  Translates controller action results into valid `Plug.Conn` responses.

  See `Phoenix.Controller.action_fallback/1` for more details.
  """
  use SwapGitApiWeb, :controller

  alias SwapGitApiWeb.ErrorView

  # This clause handles errors returned by Ecto's insert/update/delete.
  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(:unprocessable_entity)
    |> put_view(ErrorView)
    |> render("changeset.json", changeset: changeset)
  end

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> put_view(ErrorView)
    |> render(:"404")
  end

  def call(conn, {:error, :error}) do
    conn
    |> put_status(:not_found)
    |> put_view(ErrorView)
    |> render(:"422")
  end

  def call(conn, {:error, :processable_error}) do
    conn
    |> put_status(:not_found)
    |> put_view(ErrorView)
    |> render(:processable_error)
  end
end
