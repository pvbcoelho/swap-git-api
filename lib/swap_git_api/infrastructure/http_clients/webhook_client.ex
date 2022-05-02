defmodule SwapGitApi.Infrastructure.HttpClient.WebhookClient do
  use Tesla, only: [:post]
  plug Tesla.Middleware.BaseUrl, "https://webhook.site/"
  plug Tesla.Middleware.JSON

  require Logger

  def send_message(params) do
    "7f361795-21ac-4633-a689-3b5bd6d86dab"
    |> post(params)
    |> handle_response()
  end

  defp handle_response({:ok, %Tesla.Env{status: status, body: body}})
       when status in 200..299 do
    Logger.info("Callback sent successfully")
    {:ok, body}
  end

  defp handle_response({:ok, %Tesla.Env{body: body}}) do
    Logger.error("Error calling Webhook Site:: #{inspect(body, prety: true)}")

    {:error, :unhandle_error}
  end

  defp handle_response(error) do
    Logger.error("Error calling Webhook Site: #{inspect(error)}")

    {:error, :unhandle_error}
  end
end
