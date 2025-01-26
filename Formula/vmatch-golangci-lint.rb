class VmatchGolangciLint < Formula
    desc "Wrapper that automatically calls the golangci-lint version matching your project"
    homepage "https://anttiharju.dev/vmatch"

    url "https://api.github.com/repos/anttiharju/vmatch/tarball/build23"
    sha256 "2fb4faf60a570f87d412c0ccd2d5a2c5f13b3a76b793fa42c075e56924d4aaaf"
    head "https://github.com/anttiharju/vmatch"

    depends_on "go@1.23" => :build

    def install
        ENV["GOPATH"] = buildpath

        bin_path = buildpath/"src/github.com/anttiharju/vmatch"
        bin_path.install Dir["*"]
        cd bin_path do
          system "go", "build", "-C", "cmd/vmatch-golangci-lint", "-ldflags", "-s -w -buildid=brew-build23"
          bin.install "cmd/vmatch-golangci-lint/vmatch-golangci-lint"
        end
    end

    test do
        system "true"
    end
end
