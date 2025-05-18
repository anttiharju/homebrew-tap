# frozen_string_literal: true

# Homebrew formula for vmatch - a tool that automates
# matching golangci-lint and Go versions to your project.
#
# This formula installs the vmatch binary and its dependencies.
class Vmatch < Formula
  desc 'Go & golangci-lint version automation'
  homepage 'https://anttiharju.dev/vmatch'

  url 'https://api.github.com/repos/anttiharju/vmatch/tarball/build108'
  sha256 '75587490e3743c0924d077f1786f7bc0ff2b26f261451b9ce9f4b4beb65223b0'
  head 'https://github.com/anttiharju/vmatch'
  license 'GPL-3.0-only'

  depends_on 'go@1.23' => :build

  bottle do
    root_url 'https://github.com/anttiharju/vmatch/releases/download/build108'
    rebuild 1
    sha256 cellar: :any, arm64_sonoma: '02183aea09f17f700acc6e9224cd543f8561a03a74409c0aa6ef62b6e89a8015'
    sha256 cellar: :any, arm64_sequoia: '1ef07e6d6c252d793445e30b2375560b8924e379b7f6bc0d6f57ae17c6d49808'
    sha256 cellar: :any, x86_64_linux: '2ddadf8f42ed80456ef294f4587118433d62cb0858e09ff076651322bb3bc51f'
  end

  def install
    ENV['GOPATH'] = buildpath

    bin_path = buildpath / 'src/github.com/anttiharju/vmatch'
    bin_path.install Dir['*']
    cd bin_path do
      system 'go', 'build', '-ldflags', '-s -w -buildid=brew-build108'
      bin.install 'vmatch'
    end
  end

  test do
    system 'true'
  end
end
