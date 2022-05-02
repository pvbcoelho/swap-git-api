defmodule SwapGitApi.Domain.Entities.Issue do
  @moduledoc """
  This module is responsable for determinate Schema to Issues
  """

  use Ecto.Schema

  import Ecto.Changeset

  alias SwapGitApi.Domain.Entities.Owner
  alias SwapGitApi.Domain.Entities.Label

  @derive {Jason.Encoder, except: [:__meta__, :id, :inserted_at, :updated_at, :owner, :owner_id]}

  @primary_key {:id, :binary_id, autogenerate: true}

  @foreign_key_type :binary_id

  @required_params [:title, :author]

  schema "issues" do
    field(:title, :string)
    field(:author, :string)

    belongs_to(:owner, Owner)

    has_many(:labels, Label)

    timestamps()
  end

  def create_changeset(module_or_schema, params) do
    module_or_schema
    |> cast(params, @required_params ++ [:owner_id])
    |> validate_required(@required_params)
    |> cast_assoc(:labels, required: false, with: &Label.changeset/2)
    |> assoc_constraint(:owner)
  end

  def changeset(params), do: create_changeset(%__MODULE__{}, params)
  def changeset(module_or_schema, params), do: create_changeset(module_or_schema, params)
end
