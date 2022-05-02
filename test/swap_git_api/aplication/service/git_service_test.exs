defmodule SwapGitApi.Application.Services.GitServiceTest do
  alias SwapGitApi.Application.Handlers.ProcessHandler
  alias SwapGitApi.Application.Services.GitService
  alias SwapGitApi.Repo
  use SwapGitApi.DataCase

  describe "create_process/2" do
    test "It should create a process with status 'created' when valid parameters are taken an then, star a process that return the list of issues and contributors" do
      {:ok, data_msg} = GitService.create_process("teste_user", "teste_repo")
      assert data_msg["git_repository"] == "teste_repo"
      assert data_msg["status"] == "created"
      assert data_msg["user"] == "teste_user"

      process = ProcessHandler.get_process_by_processId(data_msg["process_id"])
      assert process != nil

      {:ok, data_msg2} = GitService.start_process(process.id, "teste_user", "teste_repo")

      contributors = List.first(data_msg2)
      issues = List.last(data_msg2)

      assert issues == [
               %{
                 "title" => "Parametrized remote types for protocols",
                 "author" => "paulperegud",
                 "labels" => [
                   %{
                     "id_git" => 207_975,
                     "node_id" => "MDU6TGFiZWwyMDc5NzU=",
                     "url" =>
                       "https://api.github.com/repos/elixir-lang/elixir/labels/Kind:Feature",
                     "name" => "Kind:Feature",
                     "color" => "0052cc",
                     "default" => false,
                     "description" => nil
                   },
                   %{
                     "id_git" => 778_790,
                     "node_id" => "MDU6TGFiZWw3Nzg3OTA=",
                     "url" =>
                       "https://api.github.com/repos/elixir-lang/elixir/labels/Note:Discussion",
                     "name" => "Note:Discussion",
                     "color" => "bfdadc",
                     "default" => false,
                     "description" => nil
                   },
                   %{
                     "id_git" => 17_739_153,
                     "node_id" => "MDU6TGFiZWwxNzczOTE1Mw==",
                     "url" => "https://api.github.com/repos/elixir-lang/elixir/labels/App:Elixir",
                     "name" => "App:Elixir",
                     "color" => "CCCCCC",
                     "default" => false,
                     "description" => nil
                   },
                   %{
                     "id_git" => 39_802_986,
                     "node_id" => "MDU6TGFiZWwzOTgwMjk4Ng==",
                     "url" =>
                       "https://api.github.com/repos/elixir-lang/elixir/labels/Level:Advanced",
                     "name" => "Level:Advanced",
                     "color" => "f7c6c7",
                     "default" => false,
                     "description" => nil
                   }
                 ],
                 "owner_id" => process.owner_id
               }
             ]

      assert contributors == [
               %{
                 "name" => "José Valim",
                 "qtd_commits" => 2,
                 "user" => "josevalim",
                 "owner_id" => process.owner_id
               },
               %{
                 "name" => "Artem Solomatin",
                 "qtd_commits" => 1,
                 "user" => "solar05",
                 "owner_id" => process.owner_id
               },
               %{
                 "name" => "Eksperimental",
                 "qtd_commits" => 1,
                 "user" => "eksperimental",
                 "owner_id" => process.owner_id
               },
               %{
                 "name" => "Kai",
                 "qtd_commits" => 1,
                 "user" => "kw7oe",
                 "owner_id" => process.owner_id
               }
             ]
    end
  end
end
