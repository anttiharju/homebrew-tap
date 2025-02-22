class Vmatch < Formula
    desc ""Go & golangci-lint version automation""
    homepage "https://anttiharju.dev/vmatch"

    url "https://api.github.com/repos/anttiharju/vmatch/tarball/build46"
    sha256 "248d16f47ba4861f181392ec6f191db88520274ce0614dd5f9503e50fb731351"
    head "https://github.com/anttiharju/vmatch"

    depends_on "go@1.23" => :build

    def install
        ENV["GOPATH"] = buildpath

        bin_path = buildpath/"src/github.com/anttiharju/vmatch"
        bin_path.install Dir["*"]
        cd bin_path do
          system "go", "build", "-ldflags", "-s -w -buildid=brew-build46"
          bin.install "vmatch"
        end
    end

    test do
        system "true"
    end
end
