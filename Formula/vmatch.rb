# frozen_string_literal: true

# Homebrew formula for vmatch - a tool that automates
# matching golangci-lint and Go versions to your project.
#
# This formula installs the vmatch binary and its dependencies.
class Vmatch < Formula
  desc 'Go & golangci-lint version automation'
  homepage 'https://anttiharju.dev/vmatch'

  url 'https://api.github.com/repos/anttiharju/vmatch/tarball/v0.1.3'
  sha256 'a63689ceb4861aaff92ff47974a953cc4d02df2026d0162805b6148404ea79bc'
  head 'https://github.com/anttiharju/vmatch'
  license 'GPL-3.0-only'

  depends_on 'go@1.24' => :build

  bottle do
    root_url 'https://github.com/anttiharju/vmatch/releases/download/v0.1.3'
    rebuild 1
    sha256 cellar: :any, arm64_sequoia: '7ada9fe1fe31718006ff7bcb12fcb61011f453c8a5b4903cb4193e8664f28d1f'
    sha256 cellar: :any, x86_64_linux: 'caca62b2d3852224b37ba82a5b0e715b744e8f63f42a2ca720f940dfb690eac3'
    sha256 cellar: :any, arm64_sonoma: '2208c1f2b2165d170db300809a053048a5e60d0f4b9bc22e3a5798e74282019b'
  end

  def install
    ENV['GOPATH'] = buildpath

    bin_path = buildpath / 'src/github.com/anttiharju/vmatch'
    bin_path.install Dir['*']
    cd bin_path do
      system 'go', 'build', '-ldflags', '-s -w -buildid=brew-v0.1.3', '-trimpath'
      bin.install 'vmatch'
    end
  end

  test do
    system 'vmatch', 'doctor'
  end
end
