class Litex < Formula
  desc "A simple formal proof language and verifier"
  homepage "https://litexlang.com"
  version "0.9.90-beta"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/litexlang/golitex/releases/download/0.9.90-beta/litex_0.9.90-beta_darwin_arm64.tar.gz"
    sha256 "842fda61e49549ff949f9623d6a7f3bee2f531b5212a6fad8f5006158659c92e"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/litexlang/golitex/releases/download/0.9.90-beta/litex_0.9.90-beta_linux_arm64.tar.gz"
      sha256 "64e28146a9e4a33ed66438c9a5e0dbab55da9b6de08386fa53423064cde32ed9"
    else
      url "https://github.com/litexlang/golitex/releases/download/0.9.90-beta/litex_0.9.90-beta_linux_amd64.tar.gz"
      sha256 "7ae3f3cf06b0ad447d00230d88cfa6f6fbcb045ed682ad3616996b912225d7f1"
    end
  end

  def install
    bin.install "litex"
    pkgshare.install "std"
  end

  test do
    assert_match "litex 0.9.90-beta", shell_output("#{bin}/litex -version")
  end
end
