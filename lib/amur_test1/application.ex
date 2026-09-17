defmodule AmurTest1.Application do
  # See https://elixir.hexdocs.pm/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      AmurTest1Web.Telemetry,
      {DNSCluster, query: Application.get_env(:amur_test1, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: AmurTest1.PubSub},
      # Start a worker by calling: AmurTest1.Worker.start_link(arg)
      # {AmurTest1.Worker, arg},
      # Start to serve requests, typically the last entry
      AmurTest1Web.Endpoint
    ]

    # See https://elixir.hexdocs.pm/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: AmurTest1.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    AmurTest1Web.Endpoint.config_change(changed, removed)
    :ok
  end
end
