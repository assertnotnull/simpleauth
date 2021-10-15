defmodule SimpleAuth.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      SimpleAuth.Repo,
      # Start the Telemetry supervisor
      SimpleAuthWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: SimpleAuth.PubSub},
      # Start the Endpoint (http/https)
      SimpleAuthWeb.Endpoint
      # Start a worker by calling: SimpleAuth.Worker.start_link(arg)
      # {SimpleAuth.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SimpleAuth.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SimpleAuthWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
