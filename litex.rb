class Litex < Formula
  desc "A simple formal proof language and verifier"
  homepage "https://litexlang.com"
  version "0.9.66-beta"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/litexlang/golitex/releases/download/0.9.66-beta/litex_0.9.66-beta_darwin_arm64"
    sha256 "1b811cfdb69c7138e9a2ffdd2219bfcfdd523c0532e44ccada57f87d273b3c55"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/litexlang/golitex/releases/download/0.9.66-beta/litex_0.9.66-beta_linux_arm64"
      sha256 "2f8df7290dacb4b40189a04c6e3796a1f851f803e2487a00b2f6f26983f4ae9d"
    else
      url "https://github.com/litexlang/golitex/releases/download/0.9.66-beta/litex_0.9.66-beta_linux_amd64"
      sha256 "a713a21acdbcdb32be710e2e7dbd80ce6561a7c52fda2224e6bdd4789b20a839"
    end
  end

  def install
    bin.install Dir["litex_*"].first => "litex"
  end

  test do
    assert_match "litex 0.9.66-beta", shell_output("#{bin}/litex -version")
  end
end
