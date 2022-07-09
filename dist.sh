#!/bin/sh

if [[ $# -eq 0 ]] ; then
    echo "For use with Episode 7's distribution example"
    echo "Used to start a node without epmd and with a specific node name"
    echo "Usage: $0 <node_name>"
    exit 0
fi

export ERL_ZFLAGS="-pa _build/dev/lib/explore/ebin/ -start-epmd false -proto_dist Elixir.Explore.Dist.Service -epmd_module Elixir.Explore.Dist.Client"
iex --sname $1 -S mix