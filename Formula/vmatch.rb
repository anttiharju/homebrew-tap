# frozen_string_literal: true

# testing
# Homebrew formula for vmatch - a tool that automates
# matching golangci-lint and Go versions to your project.
#
# This formula installs the vmatch binary and its dependencies.
class Vmatch < Formula
  desc 'Go & golangci-lint version automation'
  homepage 'https://anttiharju.dev/vmatch'

  url 'https://api.github.com/repos/anttiharju/vmatch/tarball/v0.1.7'
  sha256 'b32752aedb822682ebd5084f2da531e405512b09f533118364781ba2ef2eaa69'
  head 'https://github.com/anttiharju/vmatch'
  license 'GPL-3.0-only'

  depends_on 'go@1.24' => :build

  bottle do
    root_url 'https://github.com/anttiharju/vmatch/releases/download/v0.1.7'
    rebuild 1
    sha256 cellar: :any, arm64_sequoia: '3313f12905e51c9f5a1527f903e9b7ecc4e5d9e9ed4acff2ac76e3809ca6ae03'
    sha256 cellar: :any, arm64_sonoma: 'e3d286b2bd2bf2d6d4a720bca7c5b233196f3a00e3f1791d06b59a4b6ac71190'
    sha256 cellar: :any, x86_64_linux: '114bc6a09d5999bbef5f07189693a87d4156f271fbbbb8c3b7ef8c5b49a1625c'
  end

  def install
    ENV['GOPATH'] = buildpath

    bin_path = buildpath / 'src/github.com/anttiharju/vmatch'
    bin_path.install Dir['*']
    cd bin_path do
      system 'go', 'build', '-ldflags', '-s -w -buildid=brew-v0.1.7', '-trimpath'
      bin.install 'vmatch'
    end
  end

  test do
    system 'vmatch', 'doctor'
  end
end
