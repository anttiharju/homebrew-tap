class Vmatch < Formula
    desc "Go & golangci-lint version automation"
    homepage "https://anttiharju.dev/vmatch"

    url "https://api.github.com/repos/anttiharju/vmatch/tarball/build50"
    sha256 "7c1e891793759f6b66e1ae52945ad1a20ca032ebf04d55e24e4a20aab5fe43a9"
    head "https://github.com/anttiharju/vmatch"

    depends_on "go@1.23" => :build

    def install
        ENV["GOPATH"] = buildpath

        bin_path = buildpath/"src/github.com/anttiharju/vmatch"
        bin_path.install Dir["*"]
        cd bin_path do
          system "go", "build", "-ldflags", "-s -w -buildid=brew-build50"
          bin.install "vmatch"
        end
    end

    test do
        system "true"
    end
end
