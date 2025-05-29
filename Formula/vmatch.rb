# frozen_string_literal: true

class Vmatch < Formula
  desc 'Go & golangci-lint version automation'
  homepage 'https://anttiharju.dev/vmatch'
  version '0.1.4'
  license 'GPL-3.0-only'

  on_macos do
    if Hardware::CPU.intel?
      url 'https://github.com/anttiharju/vmatch/releases/download/v0.1.4/vmatch-darwin-amd64.tar.gz'
      sha256 'a071c5ce9e1bb77e84017adea1e76cdd06b2ab63d584b0ec30472caf56678331'

      def install
        bin.install "vmatch"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/anttiharju/vmatch/releases/download/v0.1.4/vmatch-darwin-arm64.tar.gz"
      sha256 '0ec6d4a136274dbf93be2166bb2910c4e275b482de1a92e040e57386857b7ce4'

      def install
        bin.install "vmatch"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/anttiharju/vmatch/releases/download/v0.1.4/vmatch-linux-amd64.tar.gz"
        sha256 '7e7ae3087d24b9782f827ca8cea8fc5747cfa1c5155ea22b5974a41174438c6c'

        def install
          bin.install "vmatch"
        end
      end
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/anttiharju/vmatch/releases/download/v0.1.4/vmatch-linux-arm64.tar.gz"
        sha256 '65cc3cb5bf5bd0d6b73514326fb371581668d052841fc68123f3cbf19c0633ce'

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
