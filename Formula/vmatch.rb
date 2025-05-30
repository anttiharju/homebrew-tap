# frozen_string_literal: true

class Vmatch < Formula
  desc 'Go & golangci-lint version automation'
  homepage 'https://anttiharju.dev/vmatch'
  version '0.1.6'
  license 'GPL-3.0-only'

  on_macos do
    if Hardware::CPU.intel?
      url 'https://github.com/anttiharju/vmatch/releases/download/v0.1.6/vmatch-darwin-amd64.tar.gz'
      sha256 'c43fc457aa72b1e31dff14500221e4120fbeddff778afac82ffc44a11e0a00e4'

      def install
        bin.install "vmatch"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/anttiharju/vmatch/releases/download/v0.1.6/vmatch-darwin-arm64.tar.gz"
      sha256 '29f7a7b693d3340b30fbd237a73fbdf9969510c5bf92eda5e5b78ba175145811'

      def install
        bin.install "vmatch"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/anttiharju/vmatch/releases/download/v0.1.6/vmatch-linux-amd64.tar.gz"
        sha256 '3aa26a063bc44476d9c06c5852a63ba1fc45cfc8cd285e4b60618cb77b3aaa57'

        def install
          bin.install "vmatch"
        end
      end
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/anttiharju/vmatch/releases/download/v0.1.6/vmatch-linux-arm64.tar.gz"
        sha256 'f49eed3dd7acbe9f9306b9942ee435d4ea8db05df93ce08ddab964765c36dc8d'

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
