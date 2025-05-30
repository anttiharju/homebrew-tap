# frozen_string_literal: true

class Vmatch < Formula
  desc 'Go & golangci-lint version automation'
  homepage 'https://anttiharju.dev/vmatch'
  version '1.0.0'
  license 'GPL-3.0-only'

  on_macos do
    if Hardware::CPU.intel?
      url 'https://github.com/anttiharju/vmatch/releases/download/v1.0.0/vmatch-darwin-amd64.tar.gz'
      sha256 'cf993a7c0e1324078821cf1c2e5e96c5063e4b87df683c045b98bdf3d36c8b6d'

      def install
        bin.install "vmatch"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/anttiharju/vmatch/releases/download/v1.0.0/vmatch-darwin-arm64.tar.gz"
      sha256 '6130b7a25c62365187dd01668bea46ab6a9b2a2f50e966a03e293d65fead0262'

      def install
        bin.install "vmatch"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/anttiharju/vmatch/releases/download/v1.0.0/vmatch-linux-amd64.tar.gz"
        sha256 'd6114144ee5dd9bb1d18422792ee605bc2defb5fd5c91137473c43a3ee33f5e0'

        def install
          bin.install "vmatch"
        end
      end
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/anttiharju/vmatch/releases/download/v1.0.0/vmatch-linux-arm64.tar.gz"
        sha256 '6e8523020b85cd609e09b54298822f21ae5e13a52da396d2365f052fd833922f'

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
