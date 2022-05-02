defmodule SwapGitApi.Application.Handlers.ContributorHandler do
  import Ecto.Query, warn: false
  require Logger
  alias SwapGitApi.Domain.Entities.Contributor
  alias SwapGitApi.Infrastructure.HttpClient.GitClient
  alias SwapGitApi.Repo

  def get_all_contributor_by_ownerId(owner_id) do
    Contributor
    |> where([i], i.owner_id == ^owner_id)
    |> Repo.all()
  end

  def insert_contributor(contributor) do
    contributor
    |> Contributor.changeset()
    |> Repo.insert()
  end

  @default_quantity_per_page 100
  @default_initial_page 1

  def get_contributors(owner_id, user, git_repositorty) do
    Logger.info("ContributorHandler.get_contributors => start")

    contributors_commits_full_list =
      get_contributors_commits(
        owner_id,
        user,
        git_repositorty,
        @default_initial_page,
        @default_quantity_per_page,
        []
      )

    case contributors_commits_full_list do
      {:ok, []} ->
        Logger.info("ContributorHandler.get_contributors => finished with no commits")
        {:ok, []}

      {:ok, commits_list} ->
        Logger.info("ContributorHandler.get_contributors => counting commits quantities")
        counted_commit_list = get_name_user_qtd_commits_list(commits_list)

        Logger.info("ContributorHandler.get_contributors => Saving contributors")

        Repo.transaction(fn ->
          Enum.each(counted_commit_list, fn x -> insert_contributor(x) end)
        end)

        Logger.info("ContributorHandler.get_contributors => finish")
        counted_commit_list

      _ ->
        Logger.warn(
          "ContributorHandler.get_contributors => finished with error. Response: #{inspect(contributors_commits_full_list)}"
        )

        contributors_commits_full_list
    end
  end

  defp get_contributors_commits(
         owner_id,
         user,
         git_repositorty,
         page,
         quantity_per_page,
         commit_list
       ) do
    Logger.info("ContributorHandler.get_contributors_commits =>  Page: #{page}")
    response = GitClient.get_commits(user, git_repositorty, page, quantity_per_page)

    case response do
      {:ok, []} ->
        if commit_list == [] do
          Logger.warn("ContributorHandler.get_contributors_commits => Repository with no commits")
        else
          Logger.info("ContributorHandler.get_contributors_commits => finished successfully")
        end

        {:ok, commit_list}

      {:ok, commit_list_body} ->
        new_commit_list = commit_list ++ get_list_of_name_and_user(owner_id, commit_list_body)

        get_contributors_commits(
          owner_id,
          user,
          git_repositorty,
          page + 1,
          quantity_per_page,
          new_commit_list
        )

      {:error, :processable_error} ->
        Logger.warn(
          "ContributorHandler.get_contributors_commits => Finished with a processable_error"
        )

        response

      _ ->
        Logger.error(
          "ContributorHandler.get_contributors_commits => Finished with an unprocessable error"
        )

        response
    end
  end

  defp get_list_of_name_and_user(owner_id, commit_full_list) do
    Enum.map(commit_full_list, fn x ->
      %{
        "owner_id" => owner_id,
        "name" => x["commit"]["author"]["name"],
        "user" => x["author"]["login"]
      }
    end)
  end

  defp get_name_user_qtd_commits_list(name_login_commits_list) do
    map_commit_qtd =
      Enum.reduce(name_login_commits_list, %{}, fn x, acc ->
        Map.update(acc, x["user"], 1, &(&1 + 1))
      end)

    name_login_commits_unique_list = Enum.uniq(name_login_commits_list)

    Enum.map(name_login_commits_unique_list, fn user ->
      Map.put(user, "qtd_commits", Map.get(map_commit_qtd, user["user"]))
    end)
  end
end
