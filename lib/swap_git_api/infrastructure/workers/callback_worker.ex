defmodule SwapGitApi.Infrastructure.Workers.CallbackWorker do
  @doc """
    schedule a callback to service given a Map of data to send to a given url
  """
  @type t :: module()

  @callback schedule(Map.t()) :: {:ok, any()} | {:error, any()}

  @spec schedule(module(), Map.t()) :: {:ok, any()} | {:error, any()}
  def schedule(implementation, %{} = attrs) do
    implementation.schedule(attrs)
  end
end
