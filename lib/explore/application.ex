defmodule Explore.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    Explore.AutoCluster.start()

    children = [
      {Cluster.Supervisor, [topologies(:gossip), [name: Explore.ClusterSupervisor]]}
    ]

    opts = [strategy: :one_for_one, name: Explore.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def topologies(key) do
    case key do
      :gossip ->
        [
          exploring_elixir: [
            strategy: Cluster.Strategy.Gossip,
            # config: {},
            connect: {Explore.AutoCluster, :connect_node, []},
            disconnect: {Explore.AutoCluster, :disconnect_node, []}
            # list_nodes: {:erlang, :nodes, [:connected]},
            # child_spec: [restart: :transient]
          ]
        ]
    end
  end
end
