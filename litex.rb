class Litex < Formula
  desc "A simple formal proof language and verifier"
  homepage "https://litexlang.com"
  version "0.9.73-beta"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/litexlang/golitex/releases/download/0.9.73-beta/litex_0.9.73-beta_darwin_arm64"
    sha256 "7f0548fa69374cf25ef3fc19d9d3e5807db0957838db4ac8bae49023ab955b13"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/litexlang/golitex/releases/download/0.9.73-beta/litex_0.9.73-beta_linux_arm64"
      sha256 "178286ba97aabc30c78ccd74ba3797b71a686ff9926ad86abef7908cbb32f6a0"
    else
      url "https://github.com/litexlang/golitex/releases/download/0.9.73-beta/litex_0.9.73-beta_linux_amd64"
      sha256 "7b6023cc229353857593b66f6f5f454e1b2d1050204e8b1ab3212173d5d549bf"
    end
  end

  def install
    bin.install Dir["litex_*"].first => "litex"
  end

  test do
    assert_match "litex 0.9.73-beta", shell_output("#{bin}/litex -version")
  end
end
