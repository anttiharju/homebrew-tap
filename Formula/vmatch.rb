# frozen_string_literal: true

class Vmatch < Formula
  desc 'Go & golangci-lint version automation'
  homepage 'https://anttiharju.dev/vmatch'
  version '1.0.2'
  license 'GPL-3.0-only'

  on_macos do
    if Hardware::CPU.intel?
      url 'https://github.com/anttiharju/vmatch/releases/download/v1.0.2/vmatch-darwin-amd64.tar.gz'
      sha256 'd37fe2f6fc40dd5f3667d55902ada902912df7244076ae69a23448557acdfb0a'

      def install
        bin.install "vmatch"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/anttiharju/vmatch/releases/download/v1.0.2/vmatch-darwin-arm64.tar.gz"
      sha256 '33296c2d6f31a51e74c74bfd0d67ad81fe35be7ea1e22d99567618bedfa74d29'

      def install
        bin.install "vmatch"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/anttiharju/vmatch/releases/download/v1.0.2/vmatch-linux-amd64.tar.gz"
        sha256 '53422a84c6ad9f48a2df0440c1844c6dc56641ff9c7eea563f46b27bfa998338'

        def install
          bin.install "vmatch"
        end
      end
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/anttiharju/vmatch/releases/download/v1.0.2/vmatch-linux-arm64.tar.gz"
        sha256 '9e28d538346126855305c5f7cc5c894fc3b6de91d559a4fd90245143405e86b1'

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
