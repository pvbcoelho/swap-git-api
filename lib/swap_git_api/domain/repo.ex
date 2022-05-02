defmodule SwapGitApi.Repo do
  use Ecto.Repo,
    otp_app: :swap_git_api,
    adapter: Ecto.Adapters.Postgres
end
