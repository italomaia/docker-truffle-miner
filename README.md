Getting Started
===============

Create your blockchain/miner like this:

```
> docker run -d --name=miner --network=ether italomaia/truffle-miner
> geth attach $DTDIR/geth.ipc  # attach to the blockchain like this
```

**docker hub:** https://hub.docker.com/r/italomaia/truffle-miner/