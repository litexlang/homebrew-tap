class Litex < Formula
  desc "A simple formal proof language and verifier"
  homepage "https://litexlang.com"
  version "0.9.87-beta"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/litexlang/golitex/releases/download/0.9.87-beta/litex_0.9.87-beta_darwin_arm64"
    sha256 "9a740bb0206c9268dbf2535fda9e34d33a0d2e53e66865e2250cbdfd84101fc0"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/litexlang/golitex/releases/download/0.9.87-beta/litex_0.9.87-beta_linux_arm64"
      sha256 "d4253b1afe30169b025ed48eb23f017ded9bf6688581a9316063af5c14abf64f"
    else
      url "https://github.com/litexlang/golitex/releases/download/0.9.87-beta/litex_0.9.87-beta_linux_amd64"
      sha256 "2b017a123e18d4d4dfd09e9dd835f209e4b4c1f2cd050e90d801615a702329cf"
    end
  end

  def install
    bin.install Dir["litex_*"].first => "litex"
  end

  test do
    assert_match "litex 0.9.87-beta", shell_output("#{bin}/litex -version")
  end
end
