# frozen_string_literal: true

# Homebrew formula for vmatch - a tool that automates
# matching golangci-lint and Go versions to your project.
#
# This formula installs the vmatch binary and its dependencies.
class Vmatch < Formula
  desc 'Go & golangci-lint version automation'
  homepage 'https://anttiharju.dev/vmatch'

  url 'https://api.github.com/repos/anttiharju/vmatch/tarball/v0.1.4'
  sha256 '6b6768d83a2232ef344eefbe3fcd223d46387c5087bf5ff4bd7231e1b3bbc2a4'
  head 'https://github.com/anttiharju/vmatch'
  license 'GPL-3.0-only'

  depends_on 'go@1.24' => :build

  bottle do
    root_url 'https://github.com/anttiharju/vmatch/releases/download/v0.1.4'
    rebuild 1
    sha256 cellar: :any, arm64_sonoma: '97dea7568fe3ecd53bcfda537fec55fe1a52011667aa6b876a60ea6a945dbf1a'
    sha256 cellar: :any, arm64_sequoia: '8ec7cf03a13ab9346a6f6c6ec3295b3d56ccf66e88f52d633319c31e5dcb7a74'
    sha256 cellar: :any, x86_64_linux: '332fb546e102a531dcbd4d19eba080385c0e595f5568acbd51683871cbf0e212'
  end

  def install
    ENV['GOPATH'] = buildpath

    bin_path = buildpath / 'src/github.com/anttiharju/vmatch'
    bin_path.install Dir['*']
    cd bin_path do
      system 'go', 'build', '-ldflags', '-s -w -buildid=brew-v0.1.4', '-trimpath'
      bin.install 'vmatch'
    end
  end

  test do
    system 'vmatch', 'doctor'
  end
end
