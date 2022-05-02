defmodule SwapGitApi.Repo.Migrations.AddJobsTable do
  use Ecto.Migration

  def up do
    Oban.Migrations.up()
  end

  def dow do
    Oban.Migrations.down(version: 1)
  end
end
