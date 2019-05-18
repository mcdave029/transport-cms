defmodule TransportCmsWeb.PageController do
  use TransportCmsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
