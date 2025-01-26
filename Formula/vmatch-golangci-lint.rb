class VmatchGolangciLint < Formula
    desc "Wrapper that automatically calls the golangci-lint version matching your project"
    homepage "https://anttiharju.dev/vmatch"

    url "https://api.github.com/repos/anttiharju/vmatch/tarball/build24"
    sha256 "04e6ca42a9b7312733932f31146a261f3bf90df14566c0825942503d72721714"
    head "https://github.com/anttiharju/vmatch"

    depends_on "go@1.23" => :build

    def install
        ENV["GOPATH"] = buildpath

        bin_path = buildpath/"src/github.com/anttiharju/vmatch"
        bin_path.install Dir["*"]
        cd bin_path do
          system "go", "build", "-C", "cmd/vmatch-golangci-lint", "-ldflags", "-s -w -buildid=brew-build24"
          bin.install "cmd/vmatch-golangci-lint/vmatch-golangci-lint"
        end
    end

    test do
        system "true"
    end
end
