defmodule SwapGitApiWeb.Router do
  use SwapGitApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", SwapGitApiWeb do
    pipe_through :api

    scope "/v1" do
      post "/create_process", GitController, :create_process
      get "/check_process_status/:process_id", GitController, :check_process_status
    end
  end
end
