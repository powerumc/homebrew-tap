class Hostshook < Formula
  desc "DNS resolution override tool without modifying system hosts file"
  homepage "https://github.com/powerumc/hosts-hook"
  url "https://github.com/powerumc/hosts-hook/archive/v0.9.1.tar.gz"
  sha256 "9f828a6d06d2d055406cf3dbdcbf02f2ec7a1a8fd59ac9ba8f602cb13f87b054"
  license "MIT"
  
  #depends_on "rust" => :build
  env :std

  def install
    system "cargo", "build", "--locked", "--release", "--no-default-features", "--features", "release"

    bin.install "target/release/hostshook"
    lib.install Dir["target/release/*.{dylib,so}"]
  end

  test do
    system "#{bin}/hostshook", "--version"
  end
end
