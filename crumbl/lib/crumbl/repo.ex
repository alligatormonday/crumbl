defmodule Crumbl.Repo do
  use Ecto.Repo,
    otp_app: :crumbl,
    adapter: Ecto.Adapters.Postgres
end
