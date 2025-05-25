# frozen_string_literal: true

# testing
# Homebrew formula for vmatch - a tool that automates
# matching golangci-lint and Go versions to your project.
#
# This formula installs the vmatch binary and its dependencies.
class Vmatch < Formula
  desc 'Go & golangci-lint version automation'
  homepage 'https://anttiharju.dev/vmatch'

  url 'https://api.github.com/repos/anttiharju/vmatch/tarball/v0.1.6'
  sha256 'f99201a9ec3bb1f8fd62ebb56ec93efdcf8ab5080fa2378bbf5fa2c3357b9686'
  head 'https://github.com/anttiharju/vmatch'
  license 'GPL-3.0-only'

  depends_on 'go@1.24' => :build

  bottle do
    root_url 'https://github.com/anttiharju/vmatch/releases/download/v0.1.6'
    rebuild 1
    sha256 cellar: :any, arm64_sonoma: '7e18e3177e24ff0d288670f2a855ead405bfcefbc97a6ad95e0c2e1775462e50'
    sha256 cellar: :any, x86_64_linux: '8e6c457eb6864ba860341f587d7e148f2a60e8c2195eacb0f126c89ca91f6365'
    sha256 cellar: :any, arm64_sequoia: '9da12e04f2cd8dc3f6bfb00e27133c36b6290f95120bf40162b38c3ed928ae50'
  end

  def install
    ENV['GOPATH'] = buildpath

    bin_path = buildpath / 'src/github.com/anttiharju/vmatch'
    bin_path.install Dir['*']
    cd bin_path do
      system 'go', 'build', '-ldflags', '-s -w -buildid=brew-v0.1.6', '-trimpath'
      bin.install 'vmatch'
    end
  end

  test do
    system 'vmatch', 'doctor'
  end
end
