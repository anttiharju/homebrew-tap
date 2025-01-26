class VmatchGolangciLint < Formula
    desc "Wrapper that automatically calls the golangci-lint version matching your project"
    homepage "https://anttiharju.dev/vmatch"

    url "https://api.github.com/repos/anttiharju/vmatch/tarball/build22"
    sha256 "1d9dee708e5135ef2c92af56c23cd5e8b932de8e72049d62b443cbd497374e1f"
    head "https://github.com/anttiharju/vmatch"

    depends_on "go@1.23" => :build

    def install
        ENV["GOPATH"] = buildpath

        bin_path = buildpath/"src/github.com/anttiharju/vmatch"
        bin_path.install Dir["*"]
        cd bin_path do
          system "go", "build", "-C", "cmd/vmatch-golangci-lint", "-ldflags", "-s -w -buildid=brew-build22"
          bin.install "cmd/vmatch-golangci-lint/vmatch-golangci-lint"
        end
    end

    test do
        system "true"
    end
end
