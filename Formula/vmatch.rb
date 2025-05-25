# frozen_string_literal: true

# Homebrew formula for vmatch - a tool that automates
# matching golangci-lint and Go versions to your project.
#
# This formula installs the vmatch binary and its dependencies.
class Vmatch < Formula
  desc 'Go & golangci-lint version automation'
  homepage 'https://anttiharju.dev/vmatch'

  url 'https://api.github.com/repos/anttiharju/vmatch/tarball/build110'
  sha256 'ee5857f5e21e43aff1d9275b1157b52f2b978a98963c977091137092a9426d13'
  head 'https://github.com/anttiharju/vmatch'
  license 'GPL-3.0-only'

  depends_on 'go@1.24' => :build

  bottle do
    root_url 'https://github.com/anttiharju/vmatch/releases/download/build110'
    rebuild 1
    sha256 cellar: :any, arm64_sequoia: 'a9f9f2e34f0bab1014f2e3d5ded4131c9aee24e60f12d815db7ed35ac888497e'
    sha256 cellar: :any, x86_64_linux: '7f695e2740cde4452e0231e0c81b574187c1efb3d458d4c4776dd89d6a31b146'
    sha256 cellar: :any, arm64_sonoma: '64668dc93af9c7add110f9ae73cdb9a76d3400e90d493c6bcb2f27757615637a'
  end

  def install
    ENV['GOPATH'] = buildpath

    bin_path = buildpath / 'src/github.com/anttiharju/vmatch'
    bin_path.install Dir['*']
    cd bin_path do
      system 'go', 'build', '-ldflags', '-s -w -buildid=brew-build110'
      bin.install 'vmatch'
    end
  end

  test do
    system 'true'
  end
end
