defmodule LiveviewTestingWeb.PostLiveTest do
  @moduledoc false
  use LiveviewTestingWeb.ConnCase

  import Phoenix.LiveViewTest
  alias LiveviewTesting.Repo
  alias LiveviewTesting.Posts.Post
  alias LiveviewTesting.Factory

  describe("testing post live") do
    test "We see the posts", %{conn: conn} do
      Repo.insert!(%Post{title: "First Post", description: "Description for first post"})
      Repo.insert!(%Post{title: "Second Post", description: "Description for second post"})

      {:ok, index_live, html} =
        live(
          conn,
          Routes.post_index_path(conn, :index)
        )

      assert html =~ "Posts"
      assert html =~ "First Post"
    end

    setup %{conn: conn} do
      post_one =
        Factory.insert!(:post, title: "First Post", description: "This is the first post")

      post_two =
        Factory.insert!(:post, title: "Second Post", description: "This is the second post")

      [post_one: post_one, post_two: post_two]
    end

    test "Once you search for a post, you get filtered results of records matching the searched term",
         %{conn: conn, post_one: post_one, post_two: post_two} do
      {:ok, index_live, html} =
        live(
          conn,
          Routes.post_index_path(conn, :index)
        )

      assert html =~ post_one.title
      assert html =~ post_two.title

      searched_html =
        index_live
        |> form("#search-post-filter", post: %{search: "Fi"})
        |> render_change()

      assert searched_html =~ post_one.title
      refute searched_html =~ post_two.title
    end
  end
end
