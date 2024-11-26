# homebrew-node

Welcome to Homebrew-Node, the repository containing the Algorand node binaries formula.

This repository checks the go-algorand repository upstreams twice a day for any new (stable) node releases. If there are, it updates `algorand.rb`.

## How do I install the Algorand Node binaries?

`brew install algorandfoundation/node/algorand`.

Or `brew tap algorandfoundation/node` and then `brew install algorand`.

## How to use

The algod node command can be reached by:

```bash
  $(brew --prefix algorand)/bin/algod
```

(If you've properly set the Homebrew environment variables, `algod` is enough.)

You can run it and point it to a data directory with the `-d` flag. A data directory is a directory containing a genesis.json file.

You can find a list of them [here](https://github.com/algorand/go-algorand/tree/db7f1627e4919b05aef5392504e48b93a90a0146/installer/genesis).

To run mainnet:

```bash
  mkdir -p ~/.algorand
  curl -o ~/.algorand/genesis.json https://raw.githubusercontent.com/algorand/go-algorand/ce9b2b0870043ef9d89be9ccf5cda0c42e3af70c/installer/genesis/mainnet/genesis.json
```

You can then run algod with the following command:

```bash
    $(brew --prefix algorand)/bin/algod -d ~/.algorand
```

The data directory at `~/.algorand` will be populated with the relevant files, including the sqllite database files and the algod.admin.token file.

Note that if you choose to upgrade (`brew upgrade algorand`) or uninstall (`brew uninstall algorand`) in the future, this data directory will still be preserved. You will have to manually remove it.

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
