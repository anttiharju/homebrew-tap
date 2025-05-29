# frozen_string_literal: true

class Vmatch < Formula
  desc 'Go & golangci-lint version automation'
  homepage 'https://anttiharju.dev/vmatch'
  version '0.1.1'
  license 'GPL-3.0-only'

  on_macos do
    if Hardware::CPU.intel?
      url 'https://github.com/anttiharju/vmatch/releases/download/v0.1.1/vmatch-darwin-amd64.tar.gz'
      sha256 '782e36bd1d1c9d8f4f4060c375408c97307f8fa5be248bafd5a217f820aa1fda'

      def install
        bin.install "vmatch"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/anttiharju/vmatch/releases/download/v0.1.1/vmatch-darwin-arm64.tar.gz"
      sha256 'e05a084e8dd2043115785a79a0f6820a706e53ed333f244f8ff0e5e514758321'

      def install
        bin.install "vmatch"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/anttiharju/vmatch/releases/download/v0.1.1/vmatch-linux-amd64.tar.gz"
        sha256 '20f8c2c044b091491b057bf1527253a9bc44882f9e57faaf72e5cae286375886'

        def install
          bin.install "vmatch"
        end
      end
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/anttiharju/vmatch/releases/download/v0.1.1/vmatch-linux-arm64.tar.gz"
        sha256 '7567f8f97cc14a47dca57740dca502975915d418d8456d1d4c19e9a218ab67e0'

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
