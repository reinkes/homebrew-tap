class FancyLoginGo < Formula
    desc "Fancy AWS/Kubernetes login tool with interactive prompts and k9s integration"
    homepage "https://github.com/reinkes/go-fancy-login"
    url "https://github.com/reinkes/go-fancy-login/archive/.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
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
