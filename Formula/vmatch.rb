class Vmatch < Formula
    desc "Wrapper that automatically calls the golangci-lint version matching your project"
    homepage "https://anttiharju.dev/vmatch"

    url "https://api.github.com/repos/anttiharju/vmatch/tarball/build45"
    sha256 "3b77d03de98aa07ef0fef5ec16259e70c94d39ba6cc360fe00d68b36bf8d2462"
    head "https://github.com/anttiharju/vmatch"

    depends_on "go@1.23" => :build

    def install
        ENV["GOPATH"] = buildpath

        bin_path = buildpath/"src/github.com/anttiharju/vmatch"
        bin_path.install Dir["*"]
        cd bin_path do
          system "go", "build", "-ldflags", "-s -w -buildid=brew-build45"
          bin.install "vmatch"
        end
    end

    test do
        system "true"
    end
end
