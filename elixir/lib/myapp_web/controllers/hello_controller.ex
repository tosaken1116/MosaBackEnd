defmodule MyApiWeb.HelloController do
  use MyApiWeb, :controller

  def world(conn, _params) do
    json(conn, %{message: "Hello World"})
  end
end
