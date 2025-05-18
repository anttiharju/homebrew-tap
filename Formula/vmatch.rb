# frozen_string_literal: true

# Homebrew formula for vmatch - a tool that automates
# matching golangci-lint and Go versions to your project.
#
# This formula installs the vmatch binary and its dependencies.
class Vmatch < Formula
  desc 'golangci-lint + Go version automation'
  homepage 'https://anttiharju.dev/vmatch'

  url 'https://api.github.com/repos/anttiharju/vmatch/tarball/build102'
  sha256 '74936e1f5b1695c071f6953ea5399aacb4238c3c08ea49b0fda16cf5443d5eb0'
  head 'https://github.com/anttiharju/vmatch'
  license "GPL-3.0-only"

  depends_on 'go@1.23' => :build

  def install
    ENV['GOPATH'] = buildpath

    bin_path = buildpath / 'src/github.com/anttiharju/vmatch'
    bin_path.install Dir['*']
    cd bin_path do
      system 'go', 'build', '-ldflags', '-s -w -buildid=brew-build102'
      bin.install 'vmatch'
    end
  end

  test do
    system 'true'
  end
end
