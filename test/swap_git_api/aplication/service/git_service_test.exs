defmodule SwapGitApi.Application.Services.GitServiceTest do
  alias SwapGitApi.Application.Handlers.ProcessHandler
  alias SwapGitApi.Application.Services.GitService
  alias SwapGitApi.Repo
  use SwapGitApi.DataCase

  describe "create_process/2" do
    test "It should create a process when valid parameters are taken" do
      {:ok, data_msg} = GitService.create_process("teste_user", "teste_repo")
      assert data_msg["git_repository"] == "teste_repo"
      assert data_msg["status"] == "created"
      assert data_msg["user"] == "teste_user"

      process = ProcessHandler.get_process_by_processId(data_msg["process_id"])
      assert process != nil
    end
  end
end
