# frozen_string_literal: true

# testing
# Homebrew formula for vmatch - a tool that automates
# matching golangci-lint and Go versions to your project.
#
# This formula installs the vmatch binary and its dependencies.
class Vmatch < Formula
  desc 'golangci-lint + Go version automation'
  homepage 'https://anttiharju.dev/vmatch'

  url 'https://api.github.com/repos/anttiharju/vmatch/tarball/build99'
  sha256 'e2c16e0a750dfe5806058f419346a7db32dcd290ccc397d8c6fa489a6e0b411a'
  head 'https://github.com/anttiharju/vmatch'
  license "GPL-3.0-only"

  depends_on 'go@1.23' => :build

  def install
    ENV['GOPATH'] = buildpath

    bin_path = buildpath / 'src/github.com/anttiharju/vmatch'
    bin_path.install Dir['*']
    cd bin_path do
      system 'go', 'build', '-ldflags', '-s -w -buildid=brew-build99'
      bin.install 'vmatch'
    end
  end

  test do
    system 'true'
  end
end
