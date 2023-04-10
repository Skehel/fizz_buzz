defmodule FizzBuzzWeb.PageLive do
  use Phoenix.LiveView
  require Logger
  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, integers_per_page: 100, page: 1, numbers: fetch_data())}
  end

  @impl true
  def render(assigns) do
    ~L"""
    <div>
      <ul>
        <%= for num <- @numbers do %>
          <li><%= num %></li>
        <% end %>
      </ul>
      <div>
        <button phx-click="prev-page">Prev</button>
        <button phx-click="next-page">Next</button>
      </div>
      <div class="input-group mb-3">
        <form phx-submit="update_fizzbuzz_paginated">
          <input id="integers-per-page" type="number" class="form-control" name="new_integers_per_page" value="<%= assigns[:integers_per_page] %>"/>
          <button id="update-button" class="btn btn-outline-secondary" phx-click="">Update</button>
        </form>
    </div>
    </div>
    """
  end

  @impl true
  def handle_event("prev-page", _, socket) do
    new_page = socket.assigns.page - 1
    {:noreply, assign(socket, page: new_page, numbers: fetch_data(new_page, socket.assigns.integers_per_page))}
  end

  @impl true
  def handle_event("next-page", _, socket) do
    Logger.info socket
    new_page = socket.assigns.page + 1
    {:noreply, assign(socket, page: new_page, numbers: fetch_data(new_page, socket.assigns.integers_per_page))}
  end

  @impl true
  def handle_event("update_fizzbuzz_paginated", %{"new_integers_per_page" => input}, socket) do
    new_integers_per_page = String.to_integer(input)
    if new_integers_per_page >= 1 and new_integers_per_page <= 100000000 do
      {:noreply, assign(socket, integers_per_page: new_integers_per_page, page: 1, numbers: fetch_data(1, new_integers_per_page))}
    else
      {:noreply, socket}
    end
  end

  defp fetch_data(page \\ 1, integers_per_page \\ 100) do
    FizzBuzzPagination.get(page, integers_per_page)
  end
end
