FROM solanadevelopers/solana-workshop-image:0.0.2

ENV VERSION_ANCHOR=0.28.0

RUN apt update && apt upgrade -y && apt install libssl-dev

RUN cargo install --git https://github.com/project-serum/anchor --tag v${VERSION_ANCHOR} anchor-cli

ENTRYPOINT solana-keygen new --no-bip39-passphrase -s -o $HOME/.config/solana/id.json &&\
    solana config set --keypair $HOME/.config/solana/id.json &&\
    (solana airdrop 2 || sh) &&\
    sh