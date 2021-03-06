defmodule Oduduwa.Router do
  use Oduduwa.Web, :router

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

  scope "/", Oduduwa do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    resources "/mambos", MamboController
  end

  # Other scopes may use custom stacks.
  # scope "/api", Oduduwa do
  #   pipe_through :api
  # end
end
