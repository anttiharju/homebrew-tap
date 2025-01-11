class Vmatch < Formula
	desc "Wrapper that automatically calls the golangci-lint version matching your project"
	homepage "https://anttiharju.dev/vmatch/"

	url "https://github.com/anttiharju/vmatch/archive/refs/tags/build3.tar.gz"
	sha256 "129385d213db61f0a8256c54fb78c5db8ef8eab9287225150795a8463793d4bc"
	head "https://github.com/anttiharju/vmatch"

	depends_on "go@1.23" => :build
	depends_on "make" => :build

	def install
		ENV["GOPATH"] = buildpath

		bin_path = buildpath/"src/github.com/anttiharju/vmatch"
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
