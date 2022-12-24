defmodule CrumblWeb.UserController do
  use CrumblWeb, :controller

  alias Crumbl.Accounts

  def index(conn, _params) do
    users = Accounts.list_users()
    render(conn, "index.html", users: users, layout: false)
  end
end
