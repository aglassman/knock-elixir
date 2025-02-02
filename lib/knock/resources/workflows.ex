defmodule Knock.Workflows do
  @moduledoc """
  Functions for interacting with Knock notify resources.
  """
  alias Knock.Api

  @doc """
  Executes a notify call for the workflow with the given key.

  Note: properties must contain at least `actor` and `recipents` for the call to be valid.
  """
  @spec trigger(Knock.Client.t(), String.t(), map()) :: Api.response()
  def trigger(client, key, properties) do
    Api.post(client, "/workflows/#{key}/trigger", properties)
  end

  @doc """
  Cancels the workflow with the given cancellation key.

  Can optionally be provided with:

  - `recipients`: A list of user ids to cancel the notify for
  """
  @spec cancel(Knock.Client.t(), String.t(), String.t(), map()) :: Api.response()
  def cancel(client, key, cancellation_key, properties \\ %{}) do
    attrs = Map.put(properties, "cancellation_key", cancellation_key)
    Api.post(client, "/workflows/#{key}/cancel", attrs)
  end
end
