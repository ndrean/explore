import Config

config :libcluster,
  debug: true

# topologies: [
#   exploring_elixir: [
#     strategy: Cluster.Strategy.Gossip,
#     # config: {},
#     connect: {Explore.AutoCluster, :connect_node, []},
#     disconnect: {Explore.AutoCluster, :disconnect_node, []}
#     # list_nodes: {:erlang, :nodes, [:connected]},
#     # child_spec: [restart: :transient]
#   ]
# ]
