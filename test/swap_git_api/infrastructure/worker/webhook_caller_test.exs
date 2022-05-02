defmodule SwapGitApi.Workers.WebHookWorkerTest do
  use SwapGitApi.DataCase
  use Oban.Testing, repo: SwapGitApi.Repo

  alias SwapGitApi.Infrastructure.Workers.CallbackWorker
  alias SwapGitApi.Infrastructure.Workers.WebHookWorker

  describe "schedule" do
    test "Should schedule webhook callback correctly" do
      CallbackWorker.schedule(WebHookWorker, %{process_id: "id_test"})

      in_an_day = DateTime.add(DateTime.utc_now(), 3600 * 24, :second)

      assert_enqueued(
        worker: WebHookWorker,
        queue: :webhook,
        args: %{process_id: "id_test"},
        scheduled_at: in_an_day
      )
    end
  end
end
