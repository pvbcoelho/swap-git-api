defmodule SwapGitApp.Infrastructure.HttpClients.GenericClient do
  @moduledoc """
  This module is a generic HTTP client
  """

  defmacro __using__(opts) do
    quote do
      use Tesla

      require Logger

      adapter(Tesla.Adapter.Hackney)
      plug Tesla.Middleware.BaseUrl, base_url(unquote(opts[:base_url_key]))

      def handle_response({:ok, %Tesla.Env{status: status, body: body} = response})
          when status in 200..299 do
        {:ok, body}
      end

      def handle_response({:ok, %Tesla.Env{status: status} = response})
          when status in [408, 500..599] do
        {:error, response}
      end

      def handle_response(error) do
        {:unprocessable_error, error}
      end

      def base_url(base_url_key) do
        Application.get_env(:swap_git_app, base_url_key)[:base_url]
      end
    end
  end
end
