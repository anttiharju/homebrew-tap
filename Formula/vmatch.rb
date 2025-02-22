class Vmatch < Formula
    desc "Go & golangci-lint version automation"
    homepage "https://anttiharju.dev/vmatch"

    url "https://api.github.com/repos/anttiharju/vmatch/tarball/build48"
    sha256 "ca52e1e5d0332ecf5cd3fb24e188671c93af8e959d12ec559ffb674ab94a1d58"
    head "https://github.com/anttiharju/vmatch"

    depends_on "go@1.23" => :build

    def install
        ENV["GOPATH"] = buildpath

        bin_path = buildpath/"src/github.com/anttiharju/vmatch"
        bin_path.install Dir["*"]
        cd bin_path do
          system "go", "build", "-ldflags", "-s -w -buildid=brew-build48"
          bin.install "vmatch"
        end
    end

    test do
        system "true"
    end
end
