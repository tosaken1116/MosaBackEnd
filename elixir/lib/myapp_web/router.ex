defmodule MyappWeb.Router do
  use MyappWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", MyappWeb do
    pipe_through :api

    get "/hello", HelloController, :world
  end
end
