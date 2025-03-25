# frozen_string_literal: true

# Homebrew formula for vmatch - a tool that automates
# matching golangci-lint and Go versions to your project.
#
# This formula installs the vmatch binary and its dependencies.
class Vmatch < Formula
  desc 'golangci-lint + Go version automation'
  homepage 'https://anttiharju.dev/vmatch'

  url 'https://api.github.com/repos/anttiharju/vmatch/tarball/build76'
  sha256 '1aaf96e70c144a18551d18f613e339fa92a3664cbe0bf911a1aba14bf6319e8b'
  head 'https://github.com/anttiharju/vmatch'

  depends_on 'go@1.23' => :build

  def install
    ENV['GOPATH'] = buildpath

    bin_path = buildpath / 'src/github.com/anttiharju/vmatch'
    bin_path.install Dir['*']
    cd bin_path do
      system 'go', 'build', '-ldflags', '-s -w -buildid=brew-build76'
      bin.install 'vmatch'
    end
  end

  test do
    system 'true'
  end
end
