FROM solanadevelopers/solana-workshop-image:0.0.2

RUN apt update && apt upgrade -y && apt install libssl-dev

RUN cargo install --git https://github.com/project-serum/anchor --tag v0.25.0 anchor-cli

ENTRYPOINT solana-keygen new --no-bip39-passphrase -s -o $HOME/.config/solana/id.json &&\
    solana config set --keypair $HOME/.config/solana/id.json &&\
    (solana airdrop 2 || sh) &&\
    sh