defmodule SwapGitApi.Application.Handlers.IssueHandler do
  import Ecto.Query, warn: false
  require Logger
  alias SwapGitApi.Domain.Entities.Issue
  alias SwapGitApi.Infrastructure.HttpClient.GitClient
  alias SwapGitApi.Repo

  def get_all_issue_by_ownerId(owner_id) do
    Issue
    |> where([i], i.owner_id == ^owner_id)
    |> Repo.all()
  end

  def insert_issue(issue) do
    issue
    |> Issue.changeset()
    |> Repo.insert()
  end

  @default_quantity_per_page 100
  @default_initial_page 1

  def get_issues(owner_id, user, git_repository) do
    Logger.info("IssueHandler.get_issues => start")

    issues_full_list =
      get_issues_full_list(
        owner_id,
        user,
        git_repository,
        @default_initial_page,
        @default_quantity_per_page,
        []
      )

    case issues_full_list do
      {:ok, []} ->
        Logger.info("IssueHandler.get_issues => finished with no issues")
        {:ok, []}

      {:ok, issues_list} ->
        Logger.info("IssueHandler.get_issues => Inserting issues")

        Repo.transaction(fn ->
          Enum.each(issues_list, fn x -> insert_issue(x) end)
        end)

        issues_list

      _ ->
        Logger.warn(
          "IssueHandler.get_issues => finished with error. Response: #{inspect(issues_full_list)}"
        )

        issues_full_list
    end
  end

  defp get_issues_full_list(owner_id, user, git_repository, page, quantity_per_page, issue_list) do
    Logger.info("IssueHandler.issues_full_list =>  Page: #{page}")
    response = GitClient.get_issues(user, git_repository, page, quantity_per_page)

    case response do
      {:ok, []} ->
        if issue_list == [] do
          Logger.warn("IssueHandler.issues_full_list => Repository with no issues")
          {:ok, []}
        else
          Logger.info("IssueHandler.issues_full_list => finished successfully")
          {:ok, issue_list}
        end

      {:ok, issue_list_body} ->
        new_issue_list = issue_list ++ get_list_of_title_and_author(owner_id, issue_list_body)

        get_issues_full_list(
          owner_id,
          user,
          git_repository,
          page + 1,
          quantity_per_page,
          new_issue_list
        )

      {:error, :processable_error} ->
        Logger.warn("IssueHandler.get_issues => Finished with a processable_error")

        response

      _ ->
        Logger.error("IssueHandler.get_issues => Finished with an unprocessable error")

        response
    end
  end

  defp get_list_of_title_and_author(owner_id, commit_full_list) do
    Enum.map(commit_full_list, fn x ->
      %{
        "owner_id" => owner_id,
        "author" => x["user"]["login"],
        "labels" => parse_labels(x["labels"]),
        "title" => x["title"]
      }
    end)
  end

  def parse_labels(label_list) do
    case label_list do
      [] ->
        []

      _ ->
        Enum.map(label_list, fn %{"id" => id} = map ->
          map
          |> Map.delete("id")
          |> Map.put("id_git", id)
        end)
    end
  end
end
