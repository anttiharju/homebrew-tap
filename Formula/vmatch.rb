# frozen_string_literal: true

# Homebrew formula for vmatch - a tool that automates
# matching golangci-lint and Go versions to your project.
#
# This formula installs the vmatch binary and its dependencies.
class Vmatch < Formula
  desc 'Go & golangci-lint version automation'
  homepage 'https://anttiharju.dev/vmatch'

  url 'https://api.github.com/repos/anttiharju/vmatch/tarball/v0.1.5'
  sha256 'b2e5196744ae26322ac002d12ad535b18e30e7843cd138c82f003b5db458fe0e'
  head 'https://github.com/anttiharju/vmatch'
  license 'GPL-3.0-only'

  depends_on 'go@1.24' => :build

  bottle do
    root_url 'https://github.com/anttiharju/vmatch/releases/download/v0.1.5'
    rebuild 1
    sha256 cellar: :any, arm64_sequoia: 'd2a645478c7e55eb2472d366c4474caf2b49201fd609abdbb2dffd7b20755b4f'
    sha256 cellar: :any, arm64_sonoma: '3faeb09f3a4d55e0dab29a9cadd8204e46e48bf5693f4aac4055e8cbd087865c'
    sha256 cellar: :any, x86_64_linux: 'ada63be0d68fe5bf1db914e2a43db902dfdc6df464fe633ca5817faea7547d73'
  end

  def install
    ENV['GOPATH'] = buildpath

    bin_path = buildpath / 'src/github.com/anttiharju/vmatch'
    bin_path.install Dir['*']
    cd bin_path do
      system 'go', 'build', '-ldflags', '-s -w -buildid=brew-v0.1.5', '-trimpath'
      bin.install 'vmatch'
    end
  end

  test do
    system 'vmatch', 'doctor'
  end
end
