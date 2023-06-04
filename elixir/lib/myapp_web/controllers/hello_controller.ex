defmodule MyappWeb.HelloController do
  use MyappWeb, :controller

  def world(conn, _params) do
    json(conn, %{message: "Hello World"})
  end
end
