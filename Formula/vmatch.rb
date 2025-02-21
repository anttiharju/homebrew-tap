class Vmatch < Formula
    desc "Wrapper that automatically calls the golangci-lint version matching your project"
    homepage "https://anttiharju.dev/vmatch"

    url "https://api.github.com/repos/anttiharju/vmatch/tarball/build44"
    sha256 "d039b3a65036b62b8c74bb0f39d4a3b37a0d7b6c7fdcb746bad6c33ff3f91874"
    head "https://github.com/anttiharju/vmatch"

    depends_on "go@1.23" => :build

    def install
        ENV["GOPATH"] = buildpath

        bin_path = buildpath/"src/github.com/anttiharju/vmatch"
        bin_path.install Dir["*"]
        cd bin_path do
          system "go", "build", "-ldflags", "-s -w -buildid=brew-build44"
          bin.install "vmatch"
        end
    end

    test do
        system "true"
    end
end
