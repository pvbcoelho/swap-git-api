defmodule SwapGitApi.Domain.Entities.Contributor do
  @moduledoc """
  This module is responsable for determinate Schema to Contributor
  """

  use Ecto.Schema

  import Ecto.Changeset

  alias SwapGitApi.Domain.Entities.Owner

  @derive {Jason.Encoder, except: [:__meta__, :id, :inserted_at, :updated_at, :owner, :owner_id]}

  @primary_key {:id, :binary_id, autogenerate: true}

  @foreign_key_type :binary_id

  @required_params [:user]

  schema "contributors" do
    field(:user, :string)
    field(:name, :string)
    field(:qtd_commits, :integer)

    belongs_to(:owner, Owner)
    timestamps()
  end

  def changeset(params), do: create_changeset(%__MODULE__{}, params)
  def changeset(module_or_schema, params), do: create_changeset(module_or_schema, params)

  def create_changeset(module_or_schema, params) do
    module_or_schema
    |> cast(params, @required_params ++ [:name, :qtd_commits, :owner_id])
    |> validate_required(@required_params)
    |> assoc_constraint(:owner)
  end
end
