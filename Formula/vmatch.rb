# frozen_string_literal: true

# Homebrew formula for vmatch - a tool that automates
# matching golangci-lint and Go versions to your project.
#
# This formula installs the vmatch binary and its dependencies.
class Vmatch < Formula
  desc 'Go & golangci-lint version automation'
  homepage 'https://anttiharju.dev/vmatch'

  url 'https://api.github.com/repos/anttiharju/vmatch/tarball/v0.1.0'
  sha256 '9bd1ff7600fb36c128a0014928d4469e46fa3da0958bf974e96d3af7f0104ba5'
  head 'https://github.com/anttiharju/vmatch'
  license 'GPL-3.0-only'

  depends_on 'go@1.24' => :build

  bottle do
    root_url 'https://github.com/anttiharju/vmatch/releases/download/v0.1.0'
    rebuild 1
    sha256 cellar: :any, 0.x86_64_linux: '0b1d2ed8369bd93528ae0cbbb7d41ce9b08dc04802cfa33774426958d66d76ee'
    sha256 cellar: :any, 0.arm64_sonoma: '25d84f7c3cf1e06ca23b4e05467f9524af404917b215ae309dc2381abec1cea7'
    sha256 cellar: :any, 0.arm64_sequoia: 'db3e31c2aaa70ee1fcf8b784d211d1b6b2ad938a9ed842b92ac208338509743a'
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
