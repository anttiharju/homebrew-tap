# frozen_string_literal: true

class Vmatch < Formula
  desc 'Go & golangci-lint version automation'
  homepage 'https://anttiharju.dev/vmatch'
  version '0.1.3'
  license 'GPL-3.0-only'

  on_macos do
    if Hardware::CPU.intel?
      url 'https://github.com/anttiharju/vmatch/releases/download/v0.1.3/vmatch-darwin-amd64.tar.gz'
      sha256 '9c056941a46cfe5299e5f160ad5ea6f973e33139f9619fe449dd2d250e80e26c'

      def install
        bin.install "vmatch"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/anttiharju/vmatch/releases/download/v0.1.3/vmatch-darwin-arm64.tar.gz"
      sha256 '0e647fe44378d3c24e9790ba95475ca64b5013c0b7b5263b88094ddb74554587'

      def install
        bin.install "vmatch"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/anttiharju/vmatch/releases/download/v0.1.3/vmatch-linux-amd64.tar.gz"
        sha256 '1cef19642f51b0182f46608c5d95587750bcdf2d4c0030cfcce8c5faa2408f56'

        def install
          bin.install "vmatch"
        end
      end
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/anttiharju/vmatch/releases/download/v0.1.3/vmatch-linux-arm64.tar.gz"
        sha256 'b894a08c00043826f72cde806b7fb61b3874f976e6dfe46cf8f01c0346716ba3'

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
