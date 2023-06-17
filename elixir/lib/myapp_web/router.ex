defmodule MyappWeb.Router do
  use MyappWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :browser do
    plug :fetch_session
    plug :fetch_flash
    plug :put_secure_browser_headers
  end

  scope "/api", MyappWeb do
    pipe_through :api

    get "/hello", HelloController, :world
  end

  scope "/", MyappWeb do
    pipe_through :api

    resources "/posts", PostController
  end
end
