# Explore

When starting one node iwth `iex --sname n1 -S mix`, this starts `epdm`.

```bash
$ iex --sname n1 mix
iex>


$ epmd -names
epmd: up and running on port 4369 with data:
name node1 at port 49472

$ epmd -kill
Killed
```

```bash
$ iex --name a@127.0.0.1 -S mix
Starting node monitor process
********** Visible Nodes **********
Not connected to any cluster. We are alone.

$iex --name b@127.0.0.1 -S mix
Starting node monitor process
********** Visible Nodes **********
Not connected to any cluster. We are alone


iex(b@127.0.0.1)> Node.connect(:"a@127.0.0.1")
# when connect we get:
😃😃😃😃😃 Node joined: :"a@127.0.0.1"
true
iex(b@127.0.0.1)2> ********** Visible Nodes **********
Nodes in our cluster, including ourselves:
     :"a@127.0.0.1"
     :"b@127.0.0.1"


iex(a@127.0.0.1)>
😃😃😃😃😃 Node joined: :"b@127.0.0.1"
********** Visible Nodes **********
Nodes in our cluster, including ourselves:
     :"a@127.0.0.1"
     :"b@127.0.0.1"
```
