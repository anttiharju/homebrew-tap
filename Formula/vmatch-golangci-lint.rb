class VmatchGolangciLint < Formula
    desc "different so there's a change"
    homepage "https://anttiharju.dev/vmatch"

    url "https://github.com/anttiharju/vmatch/archive/refs/tags/build6.tar.gz"
    sha256 "3381b2e0cfc73d6f6c76f0114707178519d283ffe47220e679ae83bf6633c7db"
    head "https://github.com/anttiharju/vmatch"

    depends_on "go@1.23" => :build

    def install
        ENV["GOPATH"] = buildpath

        bin_path = buildpath/"src/github.com/anttiharju/vmatch"
        bin_path.install Dir["*"]
        cd bin_path do
          system "go", "build", "-C", "cmd/vmatch-golangci-lint", "-ldflags", "-s -w -buildid=brew-build6"
          bin.install "cmd/vmatch-golangci-lint/vmatch-golangci-lint"
        end
    end

    test do
        system "true"
    end
end
