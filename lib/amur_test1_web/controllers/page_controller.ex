defmodule AmurTest1Web.PageController do
  use AmurTest1Web, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
