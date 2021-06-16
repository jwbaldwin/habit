defmodule TempoWeb.HabitLive.Index do
  use TempoWeb, :live_view

  alias Tempo.Habits
  alias Tempo.Habits.Habit

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :habits, list_habits())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Habit")
    |> assign(:habit, Habits.get_habit!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Habit")
    |> assign(:habit, %Habit{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Habits")
    |> assign(:habit, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    habit = Habits.get_habit!(id)
    {:ok, _} = Habits.delete_habit(habit)

    {:noreply, assign(socket, :habits, list_habits())}
  end

  defp list_habits do
    Habits.list_habits()
  end
end
