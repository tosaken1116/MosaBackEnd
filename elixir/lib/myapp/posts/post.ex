defmodule Myapp.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  schema "posts" do
    field :content, :string
    field :user_id, :string
    field :created_at, :string
    field :update_at, :string
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> validate_change(:content, length: 1..500)
    |> put_change(:updated_at, DateTime.utc_now())
  end

end
