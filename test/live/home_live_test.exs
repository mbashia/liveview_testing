defmodule LiveviewTestingWeb.HomeLiveTest do
  @moduledoc false
  use LiveviewTestingWeb.ConnCase

  import Phoenix.LiveViewTest

  describe("Testing the counter on home live ") do
    test "We see the Counter and initial 0", %{conn: conn} do
      {:ok, index_live, html} =
        live(
          conn,
          Routes.home_index_path(conn, :index)
        )

      assert html =~ "Counter"
      assert html =~ "0"
    end

    test "When we click the + button, the counter is incremented by 1", %{conn: conn} do
      {:ok, index_live, html} =
        live(
          conn,
          Routes.home_index_path(conn, :index)
        )

      assert html =~ "0"

      new_html =
        index_live
        |> element("#increment-button", "+")
        |> render_click()

      assert new_html =~ "1"
      refute new_html =~ "0"
    end

    test "When we click the - button, the counter is decremented by 1", %{conn: conn} do
      {:ok, index_live, html} =
        live(
          conn,
          Routes.home_index_path(conn, :index)
        )

      assert html =~ "0"

      index_live
      |> element("#increment-button", "+")
      |> render_click()

      index_live
      |> element("#increment-button", "+")
      |> render_click()

      index_live
      |> element("#increment-button", "+")
      |> render_click()

      new_html =
        index_live
        |> element("#decrement-button", "-")
        |> render_click()

      assert new_html =~ "2"
    end
  end
end
