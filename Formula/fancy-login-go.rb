class FancyLoginGo < Formula
    desc "Fancy AWS/Kubernetes login tool with interactive prompts and k9s integration"
    homepage "https://github.com/reinkes/go-fancy-login"
    url "https://github.com/reinkes/go-fancy-login/archive/v1.0.8.tar.gz"
    sha256 "2e7dc64040e5f792e60ce21e902756fef2f551449d5d94396467f99a66f3f3f7"
    license "MIT"
    head "https://github.com/reinkes/go-fancy-login.git", branch: "main"

    depends_on "go" => :build

    def install
      system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "./cmd"
    end

    test do
      assert_match version.to_s, shell_output("#{bin}/fancy-login-go --version")
      assert_match "AWS/Kubernetes login tool", shell_output("#{bin}/fancy-login-go --help")
    end
  end
