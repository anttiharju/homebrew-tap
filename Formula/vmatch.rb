class Vmatch < Formula
    desc "golangci-lint + Go version automation"
    homepage "https://anttiharju.dev/vmatch"

    url "https://api.github.com/repos/anttiharju/vmatch/tarball/build57"
    sha256 "92ca1f38778d9e0c612799cd6a7ba9eb03574cccb6e558e29cd6f82939332d9d"
    head "https://github.com/anttiharju/vmatch"

    depends_on "go@1.23" => :build

    def install
        ENV["GOPATH"] = buildpath

        bin_path = buildpath/"src/github.com/anttiharju/vmatch"
        bin_path.install Dir["*"]
        cd bin_path do
          system "go", "build", "-ldflags", "-s -w -buildid=brew-build57"
          bin.install "vmatch"
        end
    end

    test do
        system "true"
    end
end
