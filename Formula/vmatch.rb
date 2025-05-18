# frozen_string_literal: true

# Homebrew formula for vmatch - a tool that automates
# matching golangci-lint and Go versions to your project.
#
# This formula installs the vmatch binary and its dependencies.
class Vmatch < Formula
  desc 'golangci-lint + Go version automation'
  homepage 'https://anttiharju.dev/vmatch'

  url 'https://api.github.com/repos/anttiharju/vmatch/tarball/build103'
  sha256 '1bf9103edbb8f5b79c4d616714e6fd3d0698cc95dc660c338e1bd47e5b4191e6'
  head 'https://github.com/anttiharju/vmatch'
  license 'GPL-3.0-only'

  depends_on 'go@1.23' => :build

  bottle do
    root_url 'https://github.com/anttiharju/vmatch/releases/download/build103'
    rebuild 1
    sha256 cellar: :any, x86_64_linux: '8b32aa7df8aeac78049a1de1bdda32d4f220d46d10ed2f44939ce01685252d68'
    sha256 cellar: :any, arm64_sequoia: '1906a09b2438ecc84ba39adc1f5146ce74b95f4462743cfffe808bbd915f2351'
    sha256 cellar: :any, arm64_sonoma: 'd389c8bd92d195d1740f168f9e7140035d0521b89c083b022ef59d2a74f9c9ed'
  end

  def install
    ENV['GOPATH'] = buildpath

    bin_path = buildpath / 'src/github.com/anttiharju/vmatch'
    bin_path.install Dir['*']
    cd bin_path do
      system 'go', 'build', '-ldflags', '-s -w -buildid=brew-build103'
      bin.install 'vmatch'
    end
  end

  test do
    system 'true'
  end
end
