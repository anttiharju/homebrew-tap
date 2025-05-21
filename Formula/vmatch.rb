# frozen_string_literal: true

# Homebrew formula for vmatch - a tool that automates
# matching golangci-lint and Go versions to your project.
#
# This formula installs the vmatch binary and its dependencies.
class Vmatch < Formula
  desc 'Go & golangci-lint version automation'
  homepage 'https://anttiharju.dev/vmatch'

  url 'https://api.github.com/repos/anttiharju/vmatch/tarball/build109'
  sha256 '6d98b32c8ad352368d151129ddf1d85f4a8987f63a1222f3979b0b8f736178de'
  head 'https://github.com/anttiharju/vmatch'
  license 'GPL-3.0-only'

  depends_on 'go@1.24' => :build

  bottle do
    root_url 'https://github.com/anttiharju/vmatch/releases/download/build109'
    rebuild 1
    sha256 cellar: :any, arm64_sequoia: 'c8cae83a84ad341ae0d1b547ac994b46f4dd5e373359cd2e6ff8a7f7164a18e3'
    sha256 cellar: :any, x86_64_linux: 'a4b76f5541dbac61e9063d2a7cbc20681b95a5d9eda266d4f2b806daa728cde2'
    sha256 cellar: :any, arm64_sonoma: '128490b7bd01610a2c9789d07eefeaff80f5ece28225bc055b06ec226ea1ed05'
  end

  def install
    ENV['GOPATH'] = buildpath

    bin_path = buildpath / 'src/github.com/anttiharju/vmatch'
    bin_path.install Dir['*']
    cd bin_path do
      system 'go', 'build', '-ldflags', '-s -w -buildid=brew-build109'
      bin.install 'vmatch'
    end
  end

  test do
    system 'true'
  end
end
