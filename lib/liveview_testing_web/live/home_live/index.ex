defmodule LiveviewTestingWeb.HomeLive.Index do
  use LiveviewTestingWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :counter, 0)}
  end

  def handle_event("increment", _params, socket) do
    {:noreply, assign(socket, :counter, socket.assigns.counter + 1)}
  end

  def handle_event("decrement", _params, socket) do
    {:noreply, assign(socket, :counter, socket.assigns.counter - 1)}
  end
end
