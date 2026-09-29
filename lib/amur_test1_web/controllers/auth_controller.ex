defmodule AmurTest1Web.AuthController do
  use AmurTest1Web, :controller

  @behaviour Amur.Callback

  @impl true
  def on_success(conn, %{user: user}) do
    conn
    |> put_flash(:info, "Logged in as #{user[:email]}")
    |> redirect(to: ~p"/")
    |> halt()
  end

  @impl true
  def on_failure(conn, reason) do
    IO.inspect(reason)

    conn
    |> put_flash(:error, "Authentication failed.")
    |> redirect(to: ~p"/")
    |> halt()
  end
end
