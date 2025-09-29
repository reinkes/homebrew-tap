class FancyLoginGo < Formula
    desc "Fancy AWS/Kubernetes login tool with interactive prompts and k9s integration"
    homepage "https://github.com/reinkes/go-fancy-login"
    url "https://github.com/reinkes/go-fancy-login/archive/v1.0.6.tar.gz"
    sha256 "1f566e133aa9a9423820a46032a660457824e643f7199b3ff09a77f08effc00e"
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
