# frozen_string_literal: true

# Homebrew formula for vmatch - a tool that automates
# matching golangci-lint and Go versions to your project.
#
# This formula installs the vmatch binary and its dependencies.
class Vmatch < Formula
  desc 'golangci-lint + Go version automation'
  homepage 'https://anttiharju.dev/vmatch'

  url 'https://api.github.com/repos/anttiharju/vmatch/tarball/build85'
  sha256 'a502ae8ef9d14836dd7320efe81c7f2b41568ba90dc0e7b7878f512ac007c9ae'
  head 'https://github.com/anttiharju/vmatch'

  depends_on 'go@1.23' => :build

  def install
    ENV['GOPATH'] = buildpath

    bin_path = buildpath / 'src/github.com/anttiharju/vmatch'
    bin_path.install Dir['*']
    cd bin_path do
      system 'go', 'build', '-ldflags', '-s -w -buildid=brew-build85'
      bin.install 'vmatch'
    end
  end

  test do
    system 'true'
  end
end
