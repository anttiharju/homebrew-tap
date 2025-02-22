class Vmatch < Formula
    desc "Go & golangci-lint version automation"
    homepage "https://anttiharju.dev/vmatch"

    url "https://api.github.com/repos/anttiharju/vmatch/tarball/build47"
    sha256 "f1d9e3d35a1363993bc6d64fbb7a983e551671ab1591f0100eee40cfb24c4147"
    head "https://github.com/anttiharju/vmatch"

    depends_on "go@1.23" => :build

    def install
        ENV["GOPATH"] = buildpath

        bin_path = buildpath/"src/github.com/anttiharju/vmatch"
        bin_path.install Dir["*"]
        cd bin_path do
          system "go", "build", "-ldflags", "-s -w -buildid=brew-build47"
          bin.install "vmatch"
        end
    end

    test do
        system "true"
    end
end
