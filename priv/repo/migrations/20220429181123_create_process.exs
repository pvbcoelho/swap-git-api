defmodule SwapGitApi.Repo.Migrations.CreateProcess do
  use Ecto.Migration

  def change do
    create table(:processes, primary_key: false) do
      add(:id, :uuid, primary_key: true)
      add(:status, :string, null: false)
      add(:owner_id, references(:owners, type: :uuid, column: :id), null: false)

      timestamps()
    end
  end
end
