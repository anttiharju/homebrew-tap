# frozen_string_literal: true

# Homebrew formula for vmatch - a tool that automates
# matching golangci-lint and Go versions to your project.
#
# This formula installs the vmatch binary and its dependencies.
class Vmatch < Formula
  desc 'Go & golangci-lint version automation'
  homepage 'https://anttiharju.dev/vmatch'

  url 'https://api.github.com/repos/anttiharju/vmatch/tarball/v0.1.1'
  sha256 '9b5ff0e7fd26ccd4554c7812cd422f6cd7354cf5eca0af18846971616ada2a98'
  head 'https://github.com/anttiharju/vmatch'
  license 'GPL-3.0-only'

  depends_on 'go@1.24' => :build

  bottle do
    root_url 'https://github.com/anttiharju/vmatch/releases/download/v0.1.1'
    rebuild 1
    sha256 cellar: :any, arm64_sonoma: 'e625af1cdc45e0a746127198f1a541a704272a9d0fb0e58e4bfee0fefbb4146f'
    sha256 cellar: :any, x86_64_linux: 'ce4cea839465a4d885aef64071fe80b161d94af28c65ef4214165a1777a27bce'
    sha256 cellar: :any, arm64_sequoia: '292bc3cf479c7d21b1ae24f915c7c51532a484d494e2b177da660a2e005daf4c'
  end

  def install
    ENV['GOPATH'] = buildpath

    bin_path = buildpath / 'src/github.com/anttiharju/vmatch'
    bin_path.install Dir['*']
    cd bin_path do
      system 'go', 'build', '-ldflags', '-s -w -buildid=brew-v0.1.1', '-trimpath'
      bin.install 'vmatch'
    end
  end

  test do
    system 'true'
  end
end
