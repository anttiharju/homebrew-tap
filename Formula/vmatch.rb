# frozen_string_literal: true

# Homebrew formula for vmatch - a tool that automates
# matching golangci-lint and Go versions to your project.
#
# This formula installs the vmatch binary and its dependencies.
class Vmatch < Formula
  desc 'Go & golangci-lint version automation'
  homepage 'https://anttiharju.dev/vmatch'

  url 'https://api.github.com/repos/anttiharju/vmatch/tarball/build111'
  sha256 'd76bd690b2f61e3bef4fbc8ec59ebcd3f91658d68ab49d420133822d336b149e'
  head 'https://github.com/anttiharju/vmatch'
  license 'GPL-3.0-only'

  depends_on 'go@1.24' => :build

  bottle do
    root_url 'https://github.com/anttiharju/vmatch/releases/download/build111'
    rebuild 1
    sha256 cellar: :any, x86_64_linux: 'ac554768d5bdcb483bff98066ca3ef3d1cfd5b97fbef2dad673d35b1ad11e2ae'
    sha256 cellar: :any, arm64_sequoia: '14c6cff51ceaf97731e37a36c3f60704daa3439723086e92cc466a577c43d32e'
    sha256 cellar: :any, arm64_sonoma: '705f2e1552d38e83e33692aab5f9ed108525727b44efa324c4157fbd595cdaa0'
  end

  def install
    ENV['GOPATH'] = buildpath

    bin_path = buildpath / 'src/github.com/anttiharju/vmatch'
    bin_path.install Dir['*']
    cd bin_path do
      system 'go', 'build', '-ldflags', '-s -w -buildid=brew-build111'
      bin.install 'vmatch'
    end
  end

  test do
    system 'true'
  end
end
