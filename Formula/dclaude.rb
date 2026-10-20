class Dclaude < Formula
  desc "Per-directory Claude Code accounts, selected through direnv"
  homepage "https://github.com/powerumc/dclaude-config"
  url "https://github.com/powerumc/dclaude-config/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "485cac8a4c01c84b18335b87bbed27184a4f0cff41b6bd500aa39d316dad020c"
  license "MIT"
  head "https://github.com/powerumc/dclaude-config.git", branch: "main"

  depends_on "go" => :build
  depends_on "direnv"

  def install
    system "go", "build", *std_go_args(ldflags: "-X main.version=#{version}"), "./cmd/dclaude"
    system "go", "build", *std_go_args(output: bin/"dclaude-code"), "./cmd/dclaude-code"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dclaude --version")
  end
end
