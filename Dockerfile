FROM italomaia/truffle:4.0.1

EXPOSE 8545
EXPOSE 30303
ENV CHDIR $HOME/ChainSkills
ENV DTDIR $CHDIR/private

COPY --chown=1000:1000 password.sec $HOME
COPY --chown=1000:1000 genesis.json $HOME
RUN mkdir -p ${DTDIR}

# initialize genesis
RUN geth --datadir ${DTDIR} init genesis.json

# create user accounts
RUN geth --datadir ${DTDIR} account new --password "$HOME/password.sec"
RUN geth --datadir ${DTDIR} account new --password "$HOME/password.sec"
RUN geth --datadir ${DTDIR} account new --password "$HOME/password.sec"

VOLUME ${CHDIR}

CMD geth \
    --datadir ${DTDIR} \
    --networkid 4224 \
    --mine --nodiscover \
    --rpc --rpcport "8545" --rpccorsdomain "*" \
    --port "30303" --nat "any" \
    --rpcapi eth,web3,personal,net \
    --unlock 0 \
    --password "$HOME/password.sec"
