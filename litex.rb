class Litex < Formula
  desc "A simple formal proof language and verifier"
  homepage "https://litexlang.com"
  version "0.9.98-beta"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/litexlang/golitex/releases/download/0.9.98-beta/litex_0.9.98-beta_darwin_arm64.tar.gz"
    sha256 "606d8956a7d493fc3c8ff792734d4f539df70500b45b6ec593ae0c22e63eda24"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/litexlang/golitex/releases/download/0.9.98-beta/litex_0.9.98-beta_linux_arm64.tar.gz"
      sha256 "f70e81c412b7a8fb5ffc64a2369c62e1a184597c6267930cf8962e5a845e2842"
    else
      url "https://github.com/litexlang/golitex/releases/download/0.9.98-beta/litex_0.9.98-beta_linux_amd64.tar.gz"
      sha256 "97fdcb9cebfea280a2e2d0967fafc76238e56e1b5bc92eb17e180658d1e615d1"
    end
  end

  def install
    bin.install "litex"
    pkgshare.install "std"
  end

  test do
    assert_match "litex 0.9.98-beta", shell_output("#{bin}/litex -version")
    (testpath/"test.lit").write "import Trig\nTrig::sin(0) = 0\n"
    output = shell_output("#{bin}/litex -f #{testpath}/test.lit")
    assert_match "Trig::sin(0) = 0", output
    refute_match '"result": "error"', output
  end
end
