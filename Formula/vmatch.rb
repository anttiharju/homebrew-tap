# frozen_string_literal: true

# Homebrew formula for vmatch - a tool that automates
# matching golangci-lint and Go versions to your project.
#
# This formula installs the vmatch binary and its dependencies.
class Vmatch < Formula
  desc ''
  homepage 'https://anttiharju.dev/vmatch'

  url 'https://api.github.com/repos/anttiharju/vmatch/tarball/build65'
  sha256 '64310043b6dbaf29105c85c1132b5a8bbfbfafee397da8fd0749a4b1bf041e94'
  head 'https://github.com/anttiharju/vmatch'

  depends_on 'go@1.23' => :build

  def install
    ENV['GOPATH'] = buildpath

    bin_path = buildpath / 'src/github.com/anttiharju/vmatch'
    bin_path.install Dir['*']
    cd bin_path do
      system 'go', 'build', '-ldflags', '-s -w -buildid=brew-build65'
      bin.install 'vmatch'
    end
  end

  test do
    system 'true'
  end
end
