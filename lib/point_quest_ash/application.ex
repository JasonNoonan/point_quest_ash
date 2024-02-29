defmodule PointQuestAsh.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      PointQuestAshWeb.Telemetry,
      PointQuestAsh.Repo,
      {DNSCluster, query: Application.get_env(:point_quest_ash, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: PointQuestAsh.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: PointQuestAsh.Finch},
      # Start a worker by calling: PointQuestAsh.Worker.start_link(arg)
      # {PointQuestAsh.Worker, arg},
      # Start to serve requests, typically the last entry
      PointQuestAshWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PointQuestAsh.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PointQuestAshWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
