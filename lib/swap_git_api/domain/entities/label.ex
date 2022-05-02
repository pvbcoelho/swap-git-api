defmodule SwapGitApi.Domain.Entities.Label do
  @moduledoc """
  This module is responsable for determinate Schema to Label
  """

  use Ecto.Schema

  import Ecto.Changeset

  alias SwapGitApi.Domain.Entities.Issue

  @derive {Jason.Encoder, except: [:__meta__, :id, :inserted_at, :updated_at, :issue, :issue_id]}

  @primary_key {:id, :binary_id, autogenerate: true}

  @foreign_key_type :binary_id

  @required_params [:id_git, :node_id, :url, :name]

  schema "labels" do
    field(:id_git, :integer)
    field(:node_id, :string)
    field(:url, :string)
    field(:name, :string)
    field(:color, :string)
    field(:default, :boolean)
    field(:description, :string)

    belongs_to(:issue, Issue)

    timestamps()
  end

  def create_changeset(module_or_schema, params) do
    module_or_schema
    |> cast(params, @required_params ++ [:color, :default, :description, :issue_id])
    |> validate_required(@required_params)
    |> assoc_constraint(:issue)
  end

  def changeset(params), do: create_changeset(%__MODULE__{}, params)
  def changeset(module_or_schema, params), do: create_changeset(module_or_schema, params)
end
