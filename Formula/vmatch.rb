# frozen_string_literal: true

class Vmatch < Formula
  desc 'Go & golangci-lint version automation'
  homepage 'https://anttiharju.dev/vmatch'
  version '0.1.2'
  license 'GPL-3.0-only'

  on_macos do
    if Hardware::CPU.intel?
      url 'https://github.com/anttiharju/vmatch/releases/download/v0.1.2/vmatch-darwin-amd64.tar.gz'
      sha256 'f19dcb5ee6c72d66f74687370bcac64557dbfa91b4c72f8814995a819b092915'

      def install
        bin.install "vmatch"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/anttiharju/vmatch/releases/download/v0.1.2/vmatch-darwin-arm64.tar.gz"
      sha256 'c5965b5049187cdd74847049ade0ef6aa5614f6214b6b9900883db4471c46c89'

      def install
        bin.install "vmatch"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/anttiharju/vmatch/releases/download/v0.1.2/vmatch-linux-amd64.tar.gz"
        sha256 '8a128278ef7eeae98e8c56d92441db1ee0e731e8c4b0b61d4c64917d6f78fc47'

        def install
          bin.install "vmatch"
        end
      end
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/anttiharju/vmatch/releases/download/v0.1.2/vmatch-linux-arm64.tar.gz"
        sha256 '145885e22cc765f26a51f5a3c10b9e347b6b73dca86273ba8d43bd9b0498e8df'

        def install
          bin.install "vmatch"
        end
      end
    end
  end

  test do
    system "#{bin}/vmatch doctor"
  end
end
