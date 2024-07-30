defmodule LiveviewTestingWeb.PageController do
  use LiveviewTestingWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
