# frozen_string_literal: true

class Vmatch < Formula
  desc 'Go & golangci-lint version automation'
  homepage 'https://anttiharju.dev/vmatch'
  version '1.0.1'
  license 'GPL-3.0-only'

  on_macos do
    if Hardware::CPU.intel?
      url 'https://github.com/anttiharju/vmatch/releases/download/v1.0.1/vmatch-darwin-amd64.tar.gz'
      sha256 'a4430fc553049655937c8be4d5cc1af02594925f22c493d9ce53315c7aeb4acc'

      def install
        bin.install "vmatch"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/anttiharju/vmatch/releases/download/v1.0.1/vmatch-darwin-arm64.tar.gz"
      sha256 '2027b29771147b9ef2a4ed06168d115096954bc801a58bed40609693e8cc4c29'

      def install
        bin.install "vmatch"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/anttiharju/vmatch/releases/download/v1.0.1/vmatch-linux-amd64.tar.gz"
        sha256 '679abe129e2c0d04b8f5ab55c9e6b234376863773238742ef2296378ce473aee'

        def install
          bin.install "vmatch"
        end
      end
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/anttiharju/vmatch/releases/download/v1.0.1/vmatch-linux-arm64.tar.gz"
        sha256 '189b887bd7314af41881bfd0a58549f3540d9fd34f227afdacaccd2eaec3f72e'

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
