#!/usr/bin/env bash

set -e

TAP=algorandfoundation/homebrew-node

brew tap-new $TAP

cp ./Formula/algorand.rb "$(brew --repository)/Library/Taps/$TAP/Formula/"

cd "$(brew --repository)/Library/Taps/$TAP"

brew install --build-from-source algorand

brew --prefix algorand --installed

"$(brew --prefix algorand)/bin/algod" -v

brew uninstall algorand
