defmodule SwapGitApi.Application.Handlers.ProcessHandler do
  import Ecto.Query, warn: false
  alias SwapGitApi.Domain.Entities.Process
  alias SwapGitApi.Repo

  def get_process_by_processId(processId) do
    Process
    |> where([i], i.id == ^processId)
    |> Repo.one()
  end

  def update_process(process, params) do
    process
    |> Process.changeset(params)
    |> Repo.insert_or_update()
  end
end
