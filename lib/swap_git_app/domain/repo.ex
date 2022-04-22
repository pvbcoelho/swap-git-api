defmodule SwapGitApp.Repo do
  use Ecto.Repo,
    otp_app: :swap_git_app,
    adapter: Ecto.Adapters.Postgres
end
