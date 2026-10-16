class Dclaude < Formula
  desc "Per-directory Claude Code accounts, selected through direnv"
  homepage "https://github.com/powerumc/dclaude-config"
  url "https://github.com/powerumc/dclaude-config/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  license "MIT"
  head "https://github.com/powerumc/dclaude-config.git", branch: "main"

  depends_on "go" => :build
  depends_on "direnv"

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "./cmd/dclaude"
    system "go", "build", *std_go_args(ldflags: "-s -w", output: bin/"dclaude-code"), "./cmd/dclaude-code"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dclaude --version")
  end
end
