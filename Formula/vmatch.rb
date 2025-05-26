# frozen_string_literal: true

class Vmatch < Formula
  desc 'Go & golangci-lint version automation'
  homepage 'https://anttiharju.dev/vmatch'
  version '0.0.1'
  license 'GPL-3.0-only'

  on_macos do
    if Hardware::CPU.intel?
      url 'https://github.com/anttiharju/vmatch/releases/download/v0.0.1/vmatch-darwin-amd64.tar.gz'
      sha256 'f5f94d6f07ec7a4072669a17116cc103cafa49d23b83c6893cfbf564e904788b'

      def install
        bin.install "vmatch"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/anttiharju/vmatch/releases/download/v0.0.1/vmatch-darwin-arm64.tar.gz"
      sha256 '2b0b9d8454dc7303f86d559f3d047fbf47c18bfd74597707ef5c68a00b8f125f'

      def install
        bin.install "vmatch"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/anttiharju/vmatch/releases/download/v0.0.1/vmatch-linux-amd64.tar.gz"
        sha256 'e93a90d9223d6ea892d9f089eae963454bab334d2b5576e1df00c7ba43d93f3d'

        def install
          bin.install "vmatch"
        end
      end
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/anttiharju/vmatch/releases/download/v0.0.1/vmatch-linux-arm64.tar.gz"
        sha256 '7d3cb7ef4adcc1c34fd9cb8ddddb0c63710a5f15b253dc00e8a74214187ac99d'

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
