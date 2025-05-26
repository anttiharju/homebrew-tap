# frozen_string_literal: true

class Vmatch < Formula
  desc 'Go & golangci-lint version automation'
  homepage 'https://anttiharju.dev/vmatch'
  version '0.1.0'
  license 'GPL-3.0-only'

  on_macos do
    if Hardware::CPU.intel?
      url 'https://github.com/anttiharju/vmatch/releases/download/v0.1.0/vmatch-darwin-amd64.tar.gz'
      sha256 '01638d96dc36bf4f7d213cd237cdf4187ba89755bd74898959670afdc3e8a536'

      def install
        bin.install "vmatch"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/anttiharju/vmatch/releases/download/v0.1.0/vmatch-darwin-arm64.tar.gz"
      sha256 '189ebadb26d3c2be35316f37afce8e3e3f9e67fdc20b49891953a0008759f750'

      def install
        bin.install "vmatch"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/anttiharju/vmatch/releases/download/v0.1.0/vmatch-linux-amd64.tar.gz"
        sha256 '7da174a9195d8880499f99fa9e782a53dfa150c207dcf11c46617de726df2c24'

        def install
          bin.install "vmatch"
        end
      end
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/anttiharju/vmatch/releases/download/v0.1.0/vmatch-linux-arm64.tar.gz"
        sha256 '6759087e8f38b7a94f9d59304c3eaabe0405b35283f0f24a19cbc28353e88167'

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
