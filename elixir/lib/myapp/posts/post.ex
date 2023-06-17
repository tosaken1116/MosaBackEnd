defmodule Myapp.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  schema "posts" do
    field :content, :string
    field :created_at, :string
    field :update_at, :string
    field :user_id, :string
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:user_id, :content, :created_at])
    |> validate_required([:user_id, :content, :created_at])
    |> put_change(:update_at, to_string(DateTime.utc_now()))
  end
end
