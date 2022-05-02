defmodule SwapGitApi.Repo.Migrations.CreateLabel do
  use Ecto.Migration

  def change do
    create table(:labels, primary_key: false) do
      add(:id, :uuid, primary_key: true)
      add(:id_git, :bigint, null: false)
      add(:url, :string, null: false)
      add(:name, :string, null: false)
      add(:node_id, :string, null: false)
      add(:color, :string, default: nil)
      add(:default, :boolean, default: nil)
      add(:description, :string, default: nil)
      add(:issue_id, references(:issues, type: :uuid, column: :id), null: false)

      timestamps()
    end
  end
end
