class Litex < Formula
  desc "A simple formal proof language and verifier"
  homepage "https://litexlang.com"
  version "0.9.97-beta"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/litexlang/golitex/releases/download/0.9.97-beta/litex_0.9.97-beta_darwin_arm64.tar.gz"
    sha256 "103dd8b33b701f3d13bbeca09c5303b8238f9f8421bd048d69fa084647d7a3e4"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/litexlang/golitex/releases/download/0.9.97-beta/litex_0.9.97-beta_linux_arm64.tar.gz"
      sha256 "1932d3f71d9f6bf100403677e95bdba4d9ed8813ef8c4d291f25514db9e9150d"
    else
      url "https://github.com/litexlang/golitex/releases/download/0.9.97-beta/litex_0.9.97-beta_linux_amd64.tar.gz"
      sha256 "f061074e61d94405ece0c64583ea25e0b5d809e93d87527419ab761f2050981d"
    end
  end

  def install
    bin.install "litex"
    pkgshare.install "std"
  end

  test do
    assert_match "litex 0.9.97-beta", shell_output("#{bin}/litex -version")
    (testpath/"test.lit").write "import Trig\nTrig::sin(0) = 0\n"
    output = shell_output("#{bin}/litex -f #{testpath}/test.lit")
    assert_match "Trig::sin(0) = 0", output
    refute_match '"result": "error"', output
  end
end
