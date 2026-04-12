class Litex < Formula
  desc "A simple formal proof language and verifier"
  homepage "https://litexlang.com"
  version "0.9.3-beta"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/litexlang/golitex/releases/download/0.9.3-beta/litex_0.9.3-beta_darwin_arm64"
    sha256 "a6189679cb0343080b1a7c9e5c7ddc7d643ef214f08a39b47b25949c4d303058"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/litexlang/golitex/releases/download/0.9.3-beta/litex_0.9.3-beta_linux_arm64"
      sha256 "0df6d01c62595ff4bbea71f705cf20702832894cb52df1d2f4a6161824b7c806"
    else
      url "https://github.com/litexlang/golitex/releases/download/0.9.3-beta/litex_0.9.3-beta_linux_amd64"
      sha256 "6684cc13bee51fd2be4798afc5f41470c00d20c570d8909bf9fda142cd9fa94f"
    end
  end

  def install
    bin.install Dir["litex_*"].first => "litex"
  end

  test do
    assert_match "litex 0.9.3-beta", shell_output("#{bin}/litex -version")
  end
end
