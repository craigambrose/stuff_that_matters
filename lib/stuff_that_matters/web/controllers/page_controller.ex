defmodule StuffThatMatters.Web.PageController do
  use StuffThatMatters.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
