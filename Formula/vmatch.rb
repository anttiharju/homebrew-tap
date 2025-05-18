# frozen_string_literal: true

# Homebrew formula for vmatch - a tool that automates
# matching golangci-lint and Go versions to your project.
#
# This formula installs the vmatch binary and its dependencies.
class Vmatch < Formula
  desc 'golangci-lint + Go version automation'
  homepage 'https://anttiharju.dev/vmatch'

  url 'https://api.github.com/repos/anttiharju/vmatch/tarball/build104'
  sha256 '20a42dd7f1fd1ad4c04e6839abaea9441dbc13c25063f8e0889ef44d4af83c41'
  head 'https://github.com/anttiharju/vmatch'
  license 'GPL-3.0-only'

  depends_on 'go@1.23' => :build

  bottle do
    root_url 'https://github.com/anttiharju/vmatch/releases/download/build104'
    rebuild 1
    sha256 cellar: :any, arm64_sequoia: '2ec23352bb57d817d838a491f5fd603fe0ccfe71816fb6c98b2362826f9d63f1'
    sha256 cellar: :any, x86_64_linux: 'b846e2acbb877582a0bfeb025c46779cfbf241fff82dc470fc89ccac7dba34ed'
    sha256 cellar: :any, arm64_sonoma: '014ed21a062c61750c03897b8c795d334fe068183c733cad9436685ca0d07a26'
  end

  def install
    ENV['GOPATH'] = buildpath

    bin_path = buildpath / 'src/github.com/anttiharju/vmatch'
    bin_path.install Dir['*']
    cd bin_path do
      system 'go', 'build', '-ldflags', '-s -w -buildid=brew-build104'
      bin.install 'vmatch'
    end
  end

  test do
    system 'true'
  end
end
