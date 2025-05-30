# frozen_string_literal: true

class Vmatch < Formula
  desc 'Go & golangci-lint version automation'
  homepage 'https://anttiharju.dev/vmatch'
  version '0.1.8'
  license 'GPL-3.0-only'

  on_macos do
    if Hardware::CPU.intel?
      url 'https://github.com/anttiharju/vmatch/releases/download/v0.1.8/vmatch-darwin-amd64.tar.gz'
      sha256 '8eb86d741a704e8dd4f75a769e03f442f9ea506953c22e07a54aca781fd4cc54'

      def install
        bin.install "vmatch"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/anttiharju/vmatch/releases/download/v0.1.8/vmatch-darwin-arm64.tar.gz"
      sha256 'dc5fa5257d0e8d30483c94733db051f6351ab3a16aed9341aa8e849bf3f53f84'

      def install
        bin.install "vmatch"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/anttiharju/vmatch/releases/download/v0.1.8/vmatch-linux-amd64.tar.gz"
        sha256 '1352df6fd8d71b66e7dce83d5a930f7c82165a7293e67096cb9bc3c49540542f'

        def install
          bin.install "vmatch"
        end
      end
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/anttiharju/vmatch/releases/download/v0.1.8/vmatch-linux-arm64.tar.gz"
        sha256 '2a453c280b74666b7487f67f648e759f34b953271e408c60dcff4352427de0f3'

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
