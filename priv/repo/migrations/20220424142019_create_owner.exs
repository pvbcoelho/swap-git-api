defmodule SwapGitApi.Repo.Migrations.CreateOwner do
  use Ecto.Migration

  def change do
    create table(:owners, primary_key: false) do
      add(:id, :uuid, primary_key: true)
      add(:user, :string, null: false)
      add(:git_repository, :string, null: false)

      timestamps()
    end
  end
end
