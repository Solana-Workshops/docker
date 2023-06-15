FROM solanadevelopers/solana-workshop-image-anchor:0.0.1

RUN cargo install seahorse-lang

ENTRYPOINT solana-keygen new --no-bip39-passphrase -s -o $HOME/.config/solana/id.json &&\
    solana config set --keypair $HOME/.config/solana/id.json &&\
    (solana airdrop 2 || sh) &&\
    sh