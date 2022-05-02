defmodule SwapGitApi.Infrastructure.HttpClients.GenericClient do
  @moduledoc """
  This module is a generic HTTP client
  """

  require Logger

  defmacro __using__(opts) do
    quote do
      use Tesla

      adapter(Tesla.Adapter.Hackney)
      plug Tesla.Middleware.BaseUrl, base_url(unquote(opts[:base_url_key]))

      def handle_response({:ok, %Tesla.Env{status: status, body: body} = response})
          when status == 200 do
        {:ok, body}
      end

      def handle_response({:ok, %Tesla.Env{status: status} = response})
          when status in [301, 422, 403, 408, 500..599] do
        {:error, :processable_error}
      end

      def handle_response({:ok, %Tesla.Env{status: 404} = response}) do
        {:error, :not_found}
      end

      def handle_response(response) do
        {:error, :error}
      end

      def base_url(base_url_key) do
        Application.get_env(:swap_git_api, base_url_key)[:base_url]
      end
    end
  end
end
