# frozen_string_literal: true

# Homebrew formula for vmatch - a tool that automates
# matching golangci-lint and Go versions to your project.
#
# This formula installs the vmatch binary and its dependencies.
class Vmatch < Formula
  desc 'Go & golangci-lint version automation'
  homepage 'https://anttiharju.dev/vmatch'

  url 'https://api.github.com/repos/anttiharju/vmatch/tarball/v0.1.2'
  sha256 'f8950a007bb28ff12b4d56f509210ac516921056380b0da2d9f6a3fb87dc7d94'
  head 'https://github.com/anttiharju/vmatch'
  license 'GPL-3.0-only'

  depends_on 'go@1.24' => :build

  bottle do
    root_url 'https://github.com/anttiharju/vmatch/releases/download/v0.1.2'
    rebuild 1
    sha256 cellar: :any, arm64_sequoia: '125f8560a4e551526dfec23fc19a94e8bf43d2f16a94af5a8b726a2d31414202'
    sha256 cellar: :any, arm64_sonoma: '1059abbb24428161562342ae337dd36d4a15502e8b5ee44925461ecb57218559'
    sha256 cellar: :any, x86_64_linux: '347ade356c0e24edc35b794aad0776ab5f052e3f23bdf79fa776793218038df4'
  end

  def install
    ENV['GOPATH'] = buildpath

    bin_path = buildpath / 'src/github.com/anttiharju/vmatch'
    bin_path.install Dir['*']
    cd bin_path do
      system 'go', 'build', '-ldflags', '-s -w -buildid=brew-v0.1.2', '-trimpath'
      bin.install 'vmatch'
    end
  end

  test do
    system 'true'
  end
end
