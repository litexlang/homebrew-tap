class Litex < Formula
  desc "A simple formal proof language and verifier"
  homepage "https://litexlang.com"
  version "0.9.96-beta"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/litexlang/golitex/releases/download/0.9.96-beta/litex_0.9.96-beta_darwin_arm64.tar.gz"
    sha256 "3fae78aa3afd4801c9ef8e9388c80a15e93fd4921f027479eb4b4d90455df6fe"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/litexlang/golitex/releases/download/0.9.96-beta/litex_0.9.96-beta_linux_arm64.tar.gz"
      sha256 "b0f3c41af0243ebc77f7cdef4b4204a5e81cdd15f3e48dcd9ec27e5c50bd3428"
    else
      url "https://github.com/litexlang/golitex/releases/download/0.9.96-beta/litex_0.9.96-beta_linux_amd64.tar.gz"
      sha256 "48e75165a53455191308729a0d6a38499c9ee5ca9d0f6e1b1ced87045b741745"
    end
  end

  def install
    bin.install "litex"
    pkgshare.install "std"
  end

  test do
    assert_match "litex 0.9.96-beta", shell_output("#{bin}/litex -version")
    (testpath/"test.lit").write "import Trig\nTrig::sin(0) = 0\n"
    output = shell_output("#{bin}/litex -f #{testpath}/test.lit")
    assert_match "Trig::sin(0) = 0", output
    refute_match '"result": "error"', output
  end
end
