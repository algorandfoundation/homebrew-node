class Algorand < Formula
  desc "Installs Algorand node software and runs it as a launchctl service"
  homepage "https://github.com/algorand/go-algorand"
  url "https://github.com/algorand/go-algorand/releases/download/v3.26.0-stable/node_stable_darwin-universal_3.26.0.tar.gz"
  sha256 "fc2265996e1ff87885c5da5ea553815921353161e8626524e2cc394809d0b623"

  depends_on :macos

  def install
    # List of binaries to exclude
    excluded_binaries = [
      "algorand@.service.template",
      "sudoers.template",
      "systemd-setup.sh",
      "updater",
      "update.sh",
    ]

    # Install binaries, excluding the specified ones
    Dir["bin/*"].each do |binary|
      next if excluded_binaries.include?(File.basename(binary))

      bin.install binary
    end
  end

  def caveats
    <<~EOS
      The Algorand binaries have been installed in #{bin}.
      To run algod, you can call the following:

        $(brew --prefix algorand)/bin/algod

      However, you need to first create a data directory:

        mkdir -p ~/.algorand
        curl -o ~/.algorand/genesis.json https://raw.githubusercontent.com/algorand/go-algorand/ce9b2b0870043ef9d89be9ccf5cda0c42e3af70c/installer/genesis/mainnet/genesis.json

      You can then run algod with the following command:

        $(brew --prefix algorand)/bin/algod -d ~/.algorand
    EOS
  end

  test do
    system "#{bin}/algod", "-v"
  end
end
