defmodule Mmentum.LogsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Mmentum.Logs` context.
  """

  @doc """
  Generate a log.
  """
  def log_fixture(attrs \\ %{}) do
    {:ok, log} =
      attrs
      |> Enum.into(%{

      })
      |> Mmentum.Logs.create_log()

    log
  end
end
