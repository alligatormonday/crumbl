defmodule CrumblWeb.UserHTML do
  use CrumblWeb, :html

  alias Crumbl.Accounts

  embed_templates "user_html/*"

  def first_name(%Accounts.User{name: name}) do
    name
    |> String.split(" ")
    |> Enum.at(0)
  end
end
