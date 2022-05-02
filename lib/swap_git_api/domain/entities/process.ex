defmodule SwapGitApi.Domain.Entities.Process do
  @moduledoc """
  This module is responsable for determinate Schema to Process
  """

  use Ecto.Schema

  import Ecto.Changeset

  alias SwapGitApi.Domain.Entities.Owner

  @primary_key {:id, :binary_id, autogenerate: true}

  @foreign_key_type :binary_id

  @required_params [:status]

  schema "processes" do
    field(:status, :string)

    belongs_to(:owner, Owner)
    timestamps()
  end

  def create_changeset(module_or_schema, params) do
    module_or_schema
    |> cast(params, @required_params ++ [:owner_id])
    |> validate_required(@required_params)
    |> assoc_constraint(:owner)
  end

  def changeset(params), do: create_changeset(%__MODULE__{}, params)

  def changeset(module_or_schema, params), do: create_changeset(module_or_schema, params)
end
