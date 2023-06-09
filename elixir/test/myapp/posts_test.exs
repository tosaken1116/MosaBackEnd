defmodule Myapp.PostsTest do
  use Myapp.DataCase

  alias Myapp.Posts

  describe "posts" do
    alias Myapp.Posts.Post

    import Myapp.PostsFixtures

    @invalid_attrs %{content: nil, created_at: nil, update_at: nil, user_id: nil}

    test "list_posts/0 returns all posts" do
      post = post_fixture()
      assert Posts.list_posts() == [post]
    end

    test "get_post!/1 returns the post with given id" do
      post = post_fixture()
      assert Posts.get_post!(post.id) == post
    end

    test "create_post/1 with valid data creates a post" do
      valid_attrs = %{content: "some content", created_at: "some created_at", update_at: "some update_at", user_id: "some user_id"}

      assert {:ok, %Post{} = post} = Posts.create_post(valid_attrs)
      assert post.content == "some content"
      assert post.created_at == "some created_at"
      assert post.update_at == "some update_at"
      assert post.user_id == "some user_id"
    end

    test "create_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Posts.create_post(@invalid_attrs)
    end

    test "update_post/2 with valid data updates the post" do
      post = post_fixture()
      update_attrs = %{content: "some updated content", created_at: "some updated created_at", update_at: "some updated update_at", user_id: "some updated user_id"}

      assert {:ok, %Post{} = post} = Posts.update_post(post, update_attrs)
      assert post.content == "some updated content"
      assert post.created_at == "some updated created_at"
      assert post.update_at == "some updated update_at"
      assert post.user_id == "some updated user_id"
    end

    test "update_post/2 with invalid data returns error changeset" do
      post = post_fixture()
      assert {:error, %Ecto.Changeset{}} = Posts.update_post(post, @invalid_attrs)
      assert post == Posts.get_post!(post.id)
    end

    test "delete_post/1 deletes the post" do
      post = post_fixture()
      assert {:ok, %Post{}} = Posts.delete_post(post)
      assert_raise Ecto.NoResultsError, fn -> Posts.get_post!(post.id) end
    end

    test "change_post/1 returns a post changeset" do
      post = post_fixture()
      assert %Ecto.Changeset{} = Posts.change_post(post)
    end
  end
end
