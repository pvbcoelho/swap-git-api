defmodule SwapGitApi.Domain.Entities.Owner do
  @moduledoc """
  This module is responsable for determinate Schema to Owner
  """

  use Ecto.Schema

  import Ecto.Changeset

  alias SwapGitApi.Domain.Entities.Issue
  alias SwapGitApi.Domain.Entities.Contributor
  alias SwapGitApi.Domain.Entities.Process

  @primary_key {:id, :binary_id, autogenerate: true}

  @foreign_key_type :binary_id

  @required_params [:git_repository, :user]

  @derive {Jason.Encoder, except: [:__meta__, :id, :updated_at, :process, :inserted_at]}

  schema "owners" do
    field(:git_repository, :string)
    field(:user, :string)

    has_many(:contributors, Contributor)
    has_many(:issues, Issue)
    has_one(:process, Process)

    timestamps()
  end

  defp create_changeset(module_or_schema, params) do
    module_or_schema
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> cast_assoc(:contributors, required: false, with: &Contributor.changeset/2)
    |> cast_assoc(:issues, required: false, with: &Issue.changeset/2)
    |> cast_assoc(:process, required: false, with: &Process.changeset/2)
  end

  def changeset(params), do: create_changeset(%__MODULE__{}, params)

  def changeset(module_or_schema, params), do: create_changeset(module_or_schema, params)
end
