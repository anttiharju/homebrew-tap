class Vmatch < Formula
    desc "Wrapper that automatically calls the golangci-lint version matching your project"
    homepage "https://anttiharju.dev/vmatch"

    url "https://api.github.com/repos/anttiharju/vmatch/tarball/build35"
    sha256 "1fdf07d8c8ad358b7d23b965ac27b3bfbd4eca295afa6c203343fc28cf80a899"
    head "https://github.com/anttiharju/vmatch"

    depends_on "go@1.23" => :build

    def install
        ENV["GOPATH"] = buildpath

        bin_path = buildpath/"src/github.com/anttiharju/vmatch"
        bin_path.install Dir["*"]
        cd bin_path do
          system "go", "build", "-ldflags", "-s -w -buildid=brew-build35"
          bin.install "vmatch"
        end
    end

    test do
        system "true"
    end
end
