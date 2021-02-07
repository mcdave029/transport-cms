defmodule TransportCmsWeb.Router do
  use TransportCmsWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TransportCmsWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/api" do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: TransportCmsWeb.Graphql.Schema

    forward "/", Absinthe.Plug,
      schema: TransportCmsWeb.Graphql.Schema

  end

  # Other scopes may use custom stacks.
  # scope "/api", TransportCmsWeb do
  #   pipe_through :api
  # end
end
