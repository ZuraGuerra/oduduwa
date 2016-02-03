defmodule Oduduwa.PageController do
  use Oduduwa.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
