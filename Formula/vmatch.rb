class Vmatch < Formula
    desc "Wrapper that automatically calls the golangci-lint version matching your project"
    homepage "https://anttiharju.dev/vmatch"

    url "https://api.github.com/repos/anttiharju/vmatch/tarball/build33"
    sha256 "c9db8e6fe797b0c72a09d7cba233ef792636c638b1f45fc5576b9b5d4973d741"
    head "https://github.com/anttiharju/vmatch"

    depends_on "go@1.23" => :build

    def install
        ENV["GOPATH"] = buildpath

        bin_path = buildpath/"src/github.com/anttiharju/vmatch"
        bin_path.install Dir["*"]
        cd bin_path do
          system "go", "build", "-ldflags", "-s -w -buildid=brew-build33"
          bin.install "vmatch"
        end
    end

    test do
        system "true"
    end
end
