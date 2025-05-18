# frozen_string_literal: true

# testing
# Homebrew formula for vmatch - a tool that automates
# matching golangci-lint and Go versions to your project.
#
# This formula installs the vmatch binary and its dependencies.
class Vmatch < Formula
  desc 'Go & golangci-lint version automation'
  homepage 'https://anttiharju.dev/vmatch'

  url 'https://api.github.com/repos/anttiharju/vmatch/tarball/build107'
  sha256 '55e5d066850af7069056ed34469055d8451c7251d22bf5a538c6de1a0ea4d53e'
  head 'https://github.com/anttiharju/vmatch'
  license 'GPL-3.0-only'

  depends_on 'go@1.23' => :build

  bottle do
    root_url 'https://github.com/anttiharju/vmatch/releases/download/build107'
    rebuild 1
    sha256 cellar: :any, arm64_sequoia: '1459405f6a23c0be4a579189fd1e14b1b7e31b1f4252cc0975afba599e945437'
    sha256 cellar: :any, x86_64_linux: 'ff1f32694da7581c0616f1a5e43e75ba85188ad23861658470d3b28ae5c04c72'
    sha256 cellar: :any, arm64_sonoma: '7cfc2dab1035910efde8a674752e8cac03b8a433c71541a7b7702dfa813b50e4'
  end

  def install
    ENV['GOPATH'] = buildpath

    bin_path = buildpath / 'src/github.com/anttiharju/vmatch'
    bin_path.install Dir['*']
    cd bin_path do
      system 'go', 'build', '-ldflags', '-s -w -buildid=brew-build107'
      bin.install 'vmatch'
    end
  end

  test do
    system 'true'
  end
end
