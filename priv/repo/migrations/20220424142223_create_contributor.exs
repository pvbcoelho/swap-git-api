defmodule SwapGitApi.Repo.Migrations.CreateContributor do
  use Ecto.Migration

  def change do
    create table(:contributors, primary_key: false) do
      add(:id, :uuid, primary_key: true)
      add(:user, :string, null: false)
      add(:name, :string, default: nil)
      add(:qtd_commits, :integer, default: 0)
      add(:owner_id, references(:owners, type: :uuid, column: :id), null: false)

      timestamps()
    end
  end
end
