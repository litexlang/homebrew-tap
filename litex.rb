class Litex < Formula
  desc "A simple formal proof language and verifier"
  homepage "https://litexlang.com"
  version "0.9.70-beta"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/litexlang/golitex/releases/download/0.9.70-beta/litex_0.9.70-beta_darwin_arm64"
    sha256 "3278813b06265d990135183416c217038c8bea7a2a381a8284d5d2a72e59ddf7"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/litexlang/golitex/releases/download/0.9.70-beta/litex_0.9.70-beta_linux_arm64"
      sha256 "54d78787094b3200b30f2fd848a123410036865a916c41c2960872885c8f639d"
    else
      url "https://github.com/litexlang/golitex/releases/download/0.9.70-beta/litex_0.9.70-beta_linux_amd64"
      sha256 "3f9c3ef47239669b01a3b22da9f536a494a5f1821e8c0b345fa26fe97a5534a4"
    end
  end

  def install
    bin.install Dir["litex_*"].first => "litex"
  end

  test do
    assert_match "litex 0.9.70-beta", shell_output("#{bin}/litex -version")
  end
end
