class Litex < Formula
  desc "A simple formal proof language and verifier"
  homepage "https://litexlang.com"
  version "0.9.94-beta"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/litexlang/golitex/releases/download/0.9.94-beta/litex_0.9.94-beta_darwin_arm64.tar.gz"
    sha256 "9e2120221345decdb9afe64b86cc29ee6e9e1ec76bea6196cf1b05792b9b189f"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/litexlang/golitex/releases/download/0.9.94-beta/litex_0.9.94-beta_linux_arm64.tar.gz"
      sha256 "e766c60cb4ad581d3cfa64763f5f33b974b6364facb5794ddd3e16c2e9bbddc3"
    else
      url "https://github.com/litexlang/golitex/releases/download/0.9.94-beta/litex_0.9.94-beta_linux_amd64.tar.gz"
      sha256 "250b7afef551119736ecc2991d7d882904ba2c5c4c16e21e86244313b857ea68"
    end
  end

  def install
    bin.install "litex"
    pkgshare.install "std"
  end

  test do
    assert_match "litex 0.9.94-beta", shell_output("#{bin}/litex -version")
    (testpath/"test.lit").write "import Trig\nTrig::sin(0) = 0\n"
    output = shell_output("#{bin}/litex -f #{testpath}/test.lit")
    assert_match "Trig::sin(0) = 0", output
    refute_match '"result": "error"', output
  end
end
