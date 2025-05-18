# frozen_string_literal: true

# testing
# Homebrew formula for vmatch - a tool that automates
# matching golangci-lint and Go versions to your project.
#
# This formula installs the vmatch binary and its dependencies.
class Vmatch < Formula
  desc 'golangci-lint + Go version automation'
  homepage 'https://anttiharju.dev/vmatch'

  url 'https://api.github.com/repos/anttiharju/vmatch/tarball/build97'
  sha256 '2514f9c76cdbb719185692fb086cd9880f0fd5352f0ccc6d2e82ad597a0b42f0'
  head 'https://github.com/anttiharju/vmatch'
  license "GPL-3.0-only"

  depends_on 'go@1.23' => :build

  def install
    ENV['GOPATH'] = buildpath

    bin_path = buildpath / 'src/github.com/anttiharju/vmatch'
    bin_path.install Dir['*']
    cd bin_path do
      system 'go', 'build', '-ldflags', '-s -w -buildid=brew-build97'
      bin.install 'vmatch'
    end
  end

  test do
    system 'true'
  end
end
