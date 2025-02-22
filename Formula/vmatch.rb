class Vmatch < Formula
    desc "Go & golangci-lint version automation"
    homepage "https://anttiharju.dev/vmatch"

    url "https://api.github.com/repos/anttiharju/vmatch/tarball/build54"
    sha256 "a0879802ab077a3be2e30fc856a4055d28fdee72d7cd91bd4f4c44ac2f0764c5"
    head "https://github.com/anttiharju/vmatch"

    depends_on "go@1.23" => :build

    def install
        ENV["GOPATH"] = buildpath

        bin_path = buildpath/"src/github.com/anttiharju/vmatch"
        bin_path.install Dir["*"]
        cd bin_path do
          system "go", "build", "-ldflags", "-s -w -buildid=brew-build54"
          bin.install "vmatch"
        end
    end

    test do
        system "true"
    end
end
