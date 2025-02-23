class Vmatch < Formula
    desc "golangci-lint + Go version automation"
    homepage "https://anttiharju.dev/vmatch"

    url "https://api.github.com/repos/anttiharju/vmatch/tarball/build58"
    sha256 "a2ddbb8eeedfb429186f55cb9a689535ccbf23f4a93f85d355f872f043b28a5e"
    head "https://github.com/anttiharju/vmatch"

    depends_on "go@1.23" => :build

    def install
        ENV["GOPATH"] = buildpath

        bin_path = buildpath/"src/github.com/anttiharju/vmatch"
        bin_path.install Dir["*"]
        cd bin_path do
          system "go", "build", "-ldflags", "-s -w -buildid=brew-build58"
          bin.install "vmatch"
        end
    end

    test do
        system "true"
    end
end
