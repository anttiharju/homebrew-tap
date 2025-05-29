# frozen_string_literal: true

class Vmatch < Formula
  desc 'Go & golangci-lint version automation'
  homepage 'https://anttiharju.dev/vmatch'
  version '0.1.5'
  license 'GPL-3.0-only'

  on_macos do
    if Hardware::CPU.intel?
      url 'https://github.com/anttiharju/vmatch/releases/download/v0.1.5/vmatch-darwin-amd64.tar.gz'
      sha256 '15f96368a094a7e3a98544684b99a44ae9e4808429123676738efd5a3ef1de8f'

      def install
        bin.install "vmatch"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/anttiharju/vmatch/releases/download/v0.1.5/vmatch-darwin-arm64.tar.gz"
      sha256 '5b84a2bfb89cfbb1dd2ea4b8ea3c18c2b5b0041cf42f0cdec73a6a5a8bcfe2db'

      def install
        bin.install "vmatch"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/anttiharju/vmatch/releases/download/v0.1.5/vmatch-linux-amd64.tar.gz"
        sha256 '5a4ee6895d1a37bb1a261586a3838f83cc5147cc43ff66a8ffc2e3a72940bead'

        def install
          bin.install "vmatch"
        end
      end
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/anttiharju/vmatch/releases/download/v0.1.5/vmatch-linux-arm64.tar.gz"
        sha256 '77cb3ee8c9b5edbb8bff3de05d3fb208eaf39e61fe21487242400b500c8f1053'

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
