# frozen_string_literal: true

# Homebrew formula for vmatch - a tool that automates
# matching golangci-lint and Go versions to your project.
#
# This formula installs the vmatch binary and its dependencies.
class Vmatch < Formula
  desc 'Go & golangci-lint version automation'
  homepage 'https://anttiharju.dev/vmatch'

  url 'https://api.github.com/repos/anttiharju/vmatch/tarball/v0.1.0'
  sha256 '4973c6af4a0aea15d81a8cbf809130169760d1efa6d694c2572f4ed2bd4627cc'
  head 'https://github.com/anttiharju/vmatch'
  license 'GPL-3.0-only'

  depends_on 'go@1.24' => :build

  bottle do
    root_url 'https://github.com/anttiharju/vmatch/releases/download/v0.1.0'
    rebuild 1
    sha256 cellar: :any, x86_64_linux: '227ea11957c6666262520250c0728c2e92bcd36d65cb3d5341e12d81671e7552'
    sha256 cellar: :any, arm64_sonoma: 'fc961032b579e974e219ddbb115efb233f3db8f14e5be4a0ccc3b8aa73f84ff8'
    sha256 cellar: :any, arm64_sequoia: '20d65e809b70e7df4da367c61758402d70b72747bd93cdeb9e9181e0941abdbe'
  end

  def install
    ENV['GOPATH'] = buildpath

    bin_path = buildpath / 'src/github.com/anttiharju/vmatch'
    bin_path.install Dir['*']
    cd bin_path do
      system 'go', 'build', '-ldflags', '-s -w -buildid=brew-v0.1.0'
      bin.install 'vmatch'
    end
  end

  test do
    system 'true'
  end
end
