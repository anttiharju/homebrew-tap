# frozen_string_literal: true

# This file is generated by render.bash, do not edit manually.
class Relcheck < Formula
  desc 'Performant relative link checker'
  homepage 'https://anttiharju.dev/relcheck'
  version '1.0.5'
  license 'MIT'

  on_macos do
    if Hardware::CPU.intel?
      url 'https://github.com/anttiharju/relcheck/releases/download/v1.0.5/relcheck-darwin-amd64.tar.gz'
      sha256 'd82086d81b97cdfa787c7d3c30c84fdbc6d75812891dc400237c7caf09671dcc'

      def install
        bin.install 'relcheck'
      end
    end
    if Hardware::CPU.arm?
      url 'https://github.com/anttiharju/relcheck/releases/download/v1.0.5/relcheck-darwin-arm64.tar.gz'
      sha256 '87dc7e6885b33f2e1d477eea0b9133bed57d0f654c890b121e9091379df09aaa'

      def install
        bin.install 'relcheck'
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url 'https://github.com/anttiharju/relcheck/releases/download/v1.0.5/relcheck-linux-amd64.tar.gz'
      sha256 'a2b68e1ad6438584a2c82f50234fdee1b0fe5346f936d37ff6f817dd6864571e'

      def install
        bin.install 'relcheck'
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/anttiharju/relcheck/releases/download/v1.0.5/relcheck-linux-arm64.tar.gz'
      sha256 '16691ec8682a1378f222c4604074cc99378cd22bd75e383bef031354d86289e4'

      def install
        bin.install 'relcheck'
      end
    end
  end

  test do
    system "#{bin}/relcheck version"
  end
end
