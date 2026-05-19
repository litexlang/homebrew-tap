class Litex < Formula
  desc "A simple formal proof language and verifier"
  homepage "https://litexlang.com"
  version "0.9.82-beta"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/litexlang/golitex/releases/download/0.9.82-beta/litex_0.9.82-beta_darwin_arm64"
    sha256 "dbbe8940484c31dae4b8b2d1c654ea26e8fa63f36affba01c8481b8c2d85fca4"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/litexlang/golitex/releases/download/0.9.82-beta/litex_0.9.82-beta_linux_arm64"
      sha256 "938ed26ccd65c873950cf7279fa520ae1defb56e89864385c0004d310da0739b"
    else
      url "https://github.com/litexlang/golitex/releases/download/0.9.82-beta/litex_0.9.82-beta_linux_amd64"
      sha256 "88c6d145d1a4c28b60d2cd20543badf305ee1e6d3c77a827bb9f3b86b42eb37f"
    end
  end

  def install
    bin.install Dir["litex_*"].first => "litex"
  end

  test do
    assert_match "litex 0.9.82-beta", shell_output("#{bin}/litex -version")
  end
end
