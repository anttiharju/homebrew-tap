class VmatchGolangciLint < Formula
    desc "Wrapper that automatically calls the golangci-lint version matching your project"
    homepage "https://anttiharju.dev/vmatch/"

    url "https://github.com/anttiharju/vmatch/archive/refs/tags/build5.tar.gz"
    sha256 "33d87b5789ecd5920e746ce0e8762ef09f8be4d746c6d319801c74f593d7f6ce"
    head "https://github.com/anttiharju/vmatch"

    depends_on "go@1.23" => :build

    def install
        ENV["GOPATH"] = buildpath

        bin_path = buildpath/"src/github.com/anttiharju/vmatch"
        bin_path.install Dir["*"]
        cd bin_path do
          system "go", "build", "-C", "cmd/vmatch-golangci-lint", "-ldflags", "-s -w -buildid=brew-build5 -X github.com/anttiharju/vmatch/pkg/exit.appName=vmatch-golangci-lint"
          bin.install "cmd/vmatch-golangci-lint/vmatch-golangci-lint"
        end
    end

    test do
        system "true"
    end
end
