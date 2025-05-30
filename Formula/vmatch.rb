# frozen_string_literal: true

class Vmatch < Formula
  desc 'Go & golangci-lint version automation'
  homepage 'https://anttiharju.dev/vmatch'
  version '0.1.7'
  license 'GPL-3.0-only'

  on_macos do
    if Hardware::CPU.intel?
      url 'https://github.com/anttiharju/vmatch/releases/download/v0.1.7/vmatch-darwin-amd64.tar.gz'
      sha256 '13b38681bfb21a5fa9ab804bd49c2db1106b5ecfeb0d7282511f1dc8d6b03e6a'

      def install
        bin.install "vmatch"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/anttiharju/vmatch/releases/download/v0.1.7/vmatch-darwin-arm64.tar.gz"
      sha256 'ef8f2cd18558bc060350e6c80ad5cae41a78cbbf7968eaa1c69554cb3e2a2f05'

      def install
        bin.install "vmatch"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/anttiharju/vmatch/releases/download/v0.1.7/vmatch-linux-amd64.tar.gz"
        sha256 '72be3621d6d483b512c4b33ac7a96f3d858e607dca863b2c89b2cfc27728971c'

        def install
          bin.install "vmatch"
        end
      end
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/anttiharju/vmatch/releases/download/v0.1.7/vmatch-linux-arm64.tar.gz"
        sha256 '71a85c75dccdcb2ef0eac83e62840c1321a1b6423589eae6d4c91cbaf92de365'

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
