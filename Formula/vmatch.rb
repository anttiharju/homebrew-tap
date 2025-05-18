# frozen_string_literal: true

# testing
# Homebrew formula for vmatch - a tool that automates
# matching golangci-lint and Go versions to your project.
#
# This formula installs the vmatch binary and its dependencies.
class Vmatch < Formula
  desc 'Go & golangci-lint version automation'
  homepage 'https://anttiharju.dev/vmatch'

  url 'https://api.github.com/repos/anttiharju/vmatch/tarball/build105'
  sha256 '99886aaa4357105077c996bdd41c8d29c31d8d8bb30e09478991bc950c71e420'
  head 'https://github.com/anttiharju/vmatch'
  license 'GPL-3.0-only'

  depends_on 'go@1.23' => :build

  bottle do
    root_url 'https://github.com/anttiharju/vmatch/releases/download/build105'
    rebuild 1
    sha256 cellar: :any, arm64_sequoia: 'f2c7d2beac320dbefcdf87dcc6c2b9a01254e7f636352d5271c8dc33d49ea95a'
    sha256 cellar: :any, x86_64_linux: '757a08cc0882dd6552621339a8422267c82e1f5f7f5d53d7b42fecff0d4cf7da'
    sha256 cellar: :any, arm64_sonoma: '5b0beeb3d67eb87ca2beb80f205b49399275d67395b1aaadbdd02571c5820cc6'
  end

  def install
    ENV['GOPATH'] = buildpath

    bin_path = buildpath / 'src/github.com/anttiharju/vmatch'
    bin_path.install Dir['*']
    cd bin_path do
      system 'go', 'build', '-ldflags', '-s -w -buildid=brew-build105'
      bin.install 'vmatch'
    end
  end

  test do
    system 'true'
  end
end
