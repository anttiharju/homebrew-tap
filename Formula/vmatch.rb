class Vmatch < Formula
    desc "Go & golangci-lint version automation"
    homepage "https://anttiharju.dev/vmatch"

    url "https://api.github.com/repos/anttiharju/vmatch/tarball/build49"
    sha256 "c5c27b24b1d2c8e54f39aa13270a4058ee32a2bbba358da0b57785ce0809ff4c"
    head "https://github.com/anttiharju/vmatch"

    depends_on "go@1.23" => :build

    def install
        ENV["GOPATH"] = buildpath

        bin_path = buildpath/"src/github.com/anttiharju/vmatch"
        bin_path.install Dir["*"]
        cd bin_path do
          system "go", "build", "-ldflags", "-s -w -buildid=brew-build49"
          bin.install "vmatch"
        end
    end

    test do
        system "true"
    end
end
