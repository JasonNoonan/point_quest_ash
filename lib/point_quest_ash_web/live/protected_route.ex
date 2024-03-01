defmodule PointQuestAshWeb.Live.ProtectedRoute do
  @moduledoc """
  A dummy test module to prove that authentication works
  """
  use PointQuestAshWeb, :live_view

  def render(assigns) do
    ~H"""
    <h2>Hi friends</h2>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end
