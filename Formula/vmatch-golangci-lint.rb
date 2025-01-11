class VmatchGolangciLint < Formula
	desc "Wrapper that automatically calls the golangci-lint version matching your project"
	homepage "https://anttiharju.dev/vmatch-golangci-lint/"

	url "https://github.com/anttiharju/vmatch-golangci-lint/archive/refs/tags/v0-alpha-07dd193.tar.gz"
	sha256 "bbf845be21b492933be5eb412302eb0554c08773a87feead70aeaa092ab2df0e"
	head "https://github.com/anttiharju/vmatch-golangci-lint"

	depends_on "go" => :build
	depends_on "make" => :build

	def install
		ENV["GOPATH"] = buildpath

		bin_path = buildpath/"src/github.com/anttiharju/vmatch-golangci-lint"
		bin_path.install Dir["*"]
		cd bin_path do
		  system "make", "build"
		  bin.install "bin/vmatch-golangci-lint"
		end
	  end

	test do
		system "true"
	end
end
