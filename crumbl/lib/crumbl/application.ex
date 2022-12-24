defmodule Crumbl.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      CrumblWeb.Telemetry,
      # Start the Ecto repository
      Crumbl.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Crumbl.PubSub},
      # Start Finch
      {Finch, name: Crumbl.Finch},
      # Start the Endpoint (http/https)
      CrumblWeb.Endpoint
      # Start a worker by calling: Crumbl.Worker.start_link(arg)
      # {Crumbl.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Crumbl.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    CrumblWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
