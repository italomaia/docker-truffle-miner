Getting Started
===============

Create your blockchain/miner like this:

```
> # ports are bound to host so that mist can connect to them
> docker run -d --name=miner --network=ether -p 30303:30303 -p 8545:8545 italomaia/truffle-miner
> geth attach $DTDIR/geth.ipc  # inside the container, attach to the blockchain like this
```

**docker hub:** https://hub.docker.com/r/italomaia/truffle-miner/