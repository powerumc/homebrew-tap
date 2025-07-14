class Hostshook < Formula
  desc "DNS resolution override tool without modifying system hosts file"
  homepage "https://github.com/powerumc/hosts-hook"
  url "https://github.com/powerumc/hosts-hook/archive/v0.9.1.tar.gz"
  sha256 "a6c3e20ed9a0e520b49eef17db1c7793064fd2904dc6fc2b290c2a3c828fb3c2"
  license "MIT"
  
  #depends_on "rust" => :build
  env :std

  def install
    system "cargo", "build", "--locked", "--release", "--no-default-features", "--features", "release"

    bin.install "target/release/hostshook"
    lib.install Dir["target/release/*.dylib"]
    lib.install Dir["target/release/*.so"]
  end

  test do
    system "#{bin}/hostshook", "--version"
  end
end
