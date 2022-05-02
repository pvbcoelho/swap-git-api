defmodule SwapGitApi.Application.Handlers.LabelHandler do
  import Ecto.Query, warn: false

  alias SwapGitApi.Domain.Entities.Label
  alias SwapGitApi.Repo

  def get_all_label_by_issueId(issue_id) do
    Label
    |> where([i], i.issue_id == ^issue_id)
    |> Repo.all()
  end
end
