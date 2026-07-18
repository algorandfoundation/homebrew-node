#!/usr/bin/env bash

set -e

TAP=algorandfoundation/homebrew-node

brew tap-new $TAP

cp ./Formula/algorand.rb "$(brew --repository)/Library/Taps/$TAP/Formula/"

cd "$(brew --repository)/Library/Taps/$TAP"

# Homebrew 6.0+ refuses to load formulae from third-party taps unless they are
# explicitly trusted (Tap Trust). Trust our own formula so `brew install` can
# load it. Guarded with `|| true` so this is a no-op on older Homebrew that
# predates `brew trust`.
brew trust --formula "$TAP/algorand" || true

brew install --build-from-source algorand

brew --prefix algorand --installed

"$(brew --prefix algorand)/bin/algod" -v

brew uninstall algorand
