defmodule SwapGitApi.Repo.Migrations.CreateIssue do
  use Ecto.Migration

  def change do
    create table(:issues, primary_key: false) do
      add(:id, :uuid, primary_key: true)
      add(:title, :string, null: false)
      add(:author, :string, null: false)
      add(:owner_id, references(:owners, type: :uuid, column: :id), null: false)

      timestamps()
    end
  end
end
