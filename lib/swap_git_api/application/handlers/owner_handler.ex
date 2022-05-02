defmodule SwapGitApi.Application.Handlers.OwnerHandler do
  import Ecto.Query, warn: false

  alias SwapGitApi.Domain.Entities.Owner
  alias SwapGitApi.Repo

  def get_owner_by_ownerId(ownerId) do
    Owner
    |> where([i], i.id == ^ownerId)
    |> Repo.one()
    |> Repo.preload([{:issues, :labels}, :contributors])

    # |> Jason.encode!()
  end

  def save_owner(user, git_repository) do
    %{"user" => user, "git_repository" => git_repository, "process" => %{"status" => "created"}}
    |> Owner.changeset()
    |> Repo.insert()
  end

  def update_owner(owner, params) do
    owner
    |> Owner.changeset(params)
    |> Repo.insert_or_update()
  end
end
