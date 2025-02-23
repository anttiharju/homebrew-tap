class Vmatch < Formula
    desc "golangci-lint + Go version automation"
    homepage "https://anttiharju.dev/vmatch"

    url "https://api.github.com/repos/anttiharju/vmatch/tarball/build59"
    sha256 "3b6b99f8b0101e6025b0811bed060e161083f74ed365e61bf90d5d85d126c8cb"
    head "https://github.com/anttiharju/vmatch"

    depends_on "go@1.23" => :build

    def install
        ENV["GOPATH"] = buildpath

        bin_path = buildpath/"src/github.com/anttiharju/vmatch"
        bin_path.install Dir["*"]
        cd bin_path do
          system "go", "build", "-ldflags", "-s -w -buildid=brew-build59"
          bin.install "vmatch"
        end
    end

    test do
        system "true"
    end
end
